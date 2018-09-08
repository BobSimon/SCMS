package com.xmscltd.scms.base.utils;

import com.jfinal.ext.interceptor.LogInterceptor;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.xmscltd.scms.base.common.RestResult;
import com.xmscltd.scms.base.common.RetResult;

import java.util.HashMap;
import java.util.Map;

/**
 * LongNumberGenerator
 * com.xmscltd.scms.base.utils
 * Created with IntelliJ IDEA.
 * Description:
 * Author: alio-cmchen
 * Date: 2018-06-25
 * Time: 10:35
 * Version: V1.0.0
 */
public class LongNumberGenerator {

    private final static com.jfinal.log.Log logger = com.jfinal.log.Log.getLog(LongNumberGenerator.class);
    private static int DepartNum = 1;
    private static int GroupNum = 2;

    /**
     * 生成部门长编码,从0001开始
     * @param parentNum
     * @return
     */
    public static String departLNGenerator(String parentNum) {
        Map<String, String> map = new HashMap();
        String maxSubDeptNum = "";
        if (StrKit.isBlank(parentNum)) {
            Record record = Db.findFirst("select max(longnumber) as longnumber from sys_department WHERE length(longnumber)=4");
            maxSubDeptNum = record.getStr("longnumber");
        } else {
            int length = parentNum.length();
            Record record = Db.findFirst("select max(longnumber) as longnumber from sys_department WHERE length(longnumber)=" +
                    "4+? and longnumber like concat(?,'%')", length, parentNum);
            maxSubDeptNum = record.getStr("longnumber");
        }
        String deparNum = null;
        if (StrKit.isBlank(maxSubDeptNum)) {
            deparNum = "0001";
        } else {
            int length = maxSubDeptNum.length();
            String temp = maxSubDeptNum.substring(length - 4, length);
            int intDeparNumt = Integer.valueOf(temp) + 1;
            if (intDeparNumt > 0 && intDeparNumt < 10) {
                deparNum = "000" + String.valueOf(intDeparNumt);
            } else if (10 <= intDeparNumt && intDeparNumt <= 99) {
                deparNum = "00" + String.valueOf(intDeparNumt);
            } else if (100 <= intDeparNumt && intDeparNumt <= 999) {
                deparNum = "0" + String.valueOf(intDeparNumt);
            } else if (1000 <= intDeparNumt && intDeparNumt <= 9999) {
                deparNum = String.valueOf(intDeparNumt);
            } else if (intDeparNumt > 9999) {
                logger.error("\nOH,MY GOD! SOME ERRORS OCCURED! AS FOLLOWS.\n生成部门长编号越界了.同级兄弟节点编号为[0001-9999]\n请和您的系统管理员联系!");
            } else {
                logger.error("\nOH,MY GOD! SOME ERRORS OCCURED! AS FOLLOWS.\n生成部门长编号发生未知错误,请和开发人员联系!");
            }
        }

        return parentNum + deparNum;
    }

    /**
     * 更新部门时移动节点
     * @param departid
     * @param parentNum
     * @return
     */
    public static RestResult moveDepartNode(int departid, String parentNum) {

        RestResult<String> restResult = new RestResult<String>();

        Record record = Db.findFirst("select * from sys_department WHERE id = ?", departid);

        String oldlongnumber = record.getStr("longnumber");

        if (StrKit.notBlank(parentNum) && parentNum.indexOf(oldlongnumber) == 0) {
            restResult.error("所选部门节点是自己或自己的下级节点,不能移动!");
            return restResult;
        } else {
            String longnumber = departLNGenerator(parentNum);
            if (StrKit.isBlank(longnumber)) {
                return restResult.error("创建部门内部编码发生错误!");
            } else {
                int oldLength = record.getStr("longnumber").length();
                Db.update("UPDATE sys_department set longnumber = concat(?,  RIGHT(longnumber, LENGTH(longnumber) - ?))" +
                        "where longnumber like concat(?,'%') and longnumber <> ?", longnumber, oldLength, oldlongnumber, oldlongnumber);
                restResult.success(longnumber);
                return restResult;
            }
        }
    }

}
