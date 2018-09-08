package com.xmscltd.scms.admin.controller.system;

import com.alibaba.fastjson.JSONArray;
import com.jfinal.core.paragetter.Para;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Page;
import com.xmscltd.scms.base.common.*;
import com.xmscltd.scms.base.interceptor.NotNullPara;
import com.xmscltd.scms.base.model.Department;
import com.xmscltd.scms.base.model.Log;
import com.xmscltd.scms.base.model.Res;
import com.xmscltd.scms.base.model.Weixin;
import com.xmscltd.scms.base.rest.datatable.BootStrapDataTable;
import com.xmscltd.scms.base.rest.select2.BootstrapSelect2;
import com.xmscltd.scms.base.service.DepartmentService;
import com.xmscltd.scms.base.service.ResService;
import com.xmscltd.scms.base.utils.LongNumberGenerator;
import com.xmscltd.scms.base.web.base.BaseController;
import io.jboot.Jboot;
import io.jboot.component.swagger.ParamType;
import io.jboot.core.rpc.annotation.JbootrpcService;
import io.jboot.web.controller.annotation.RequestMapping;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

import java.util.*;

/**
 * department
 * com.xmscltd.scms.admin.controller.system
 * Created with IntelliJ IDEA.
 * Description:
 * Author: Administrator-cmchen
 * Date: 2018-04-15
 * Time: 17:13
 * Version: V1.0.0
 */
@RequestMapping("/system/department")
@Api(description = "部门管理", basePath = "/system/department", tags = "部门管理接口")
public class DepartController extends BaseController {

    @JbootrpcService
    private DepartmentService departmentService;

    public void index() {

        render("main.html");
    }

    /**
     * 获取部门列表Controller
     */
    public void getDepartmentTree() {
        renderJson(getTreeList(0, null, null));
    }

    /**
     * 构建jsTree 部门树
     *
     * @param tid     顶层id
     * @param listmap
     * @param list
     * @return
     */
    private List getTreeList(Integer tid, List<Map<String, Object>> listmap, List<Department> list) {

        //获取所有的部门
        if (listmap == null || list == null) {
            list = departmentService.findAll();
            listmap = new ArrayList<Map<String, Object>>();
            for (Department d : list) {
                if (d.getParentid() == 0) {
                    //如果上级部门 ==0 ，没有父节点
                    Map<String, Object> map = new HashMap<String, Object>();
                    map.put("id", d.getId().toString());
                    map.put("name", d.getName());
                    map.put("icon", d.getIcon());
                    listmap.add(map);
                }
            }
            getTreeList(tid, listmap, list);

        } else if (listmap.size() > 0 && list.size() > 0) {
            for (Map<String, Object> mp : listmap) {
                String id = mp.get("id") + "";
                String pid = null;
                List<Map<String, Object>> childlist = new ArrayList<Map<String, Object>>();
                for (Department d : list) {
                    pid = d.getParentid() + "";
                    //遍历子部门放到children
                    if (id.equals(pid)) {
                        Map<String, Object> m = new HashMap<String, Object>();
                        m.put("id", d.getId().toString());
                        m.put("name", d.getName());
                        m.put("icon", d.getIcon());
                        childlist.add(m);
                    }
                }
                //如果存在children  放到map中
                if (childlist.size() > 0) {
                    List<String> sizelist = new ArrayList<String>();
                    sizelist.add(childlist.size() + "");
                    mp.put("children", childlist);
                    mp.put("tags", sizelist);
                    getTreeList(tid, childlist, list);
                }
            }
        }
        return listmap;
    }

    /**
     * 获取部门列表Controller
     */
    public void getDepartmentList() {
        List<Department> list = departmentService.findAll();
        renderJson(list);
    }

    /**
     * 部门详情
     */
    public void getDepartmentDetail() {
        int id = getParaToInt("id");
        Department depart = departmentService.findById(id);
        renderJson(depart);
    }

    public void getDepartTreeCombo() {
        List<Department> list = departmentService.findListOrderByColumn("longnumber desc");
        Map tree = converTreeCombo(list);
        RetResult retResult = new RetResult();
        retResult.setData(tree);
        retResult.setSuccess(true);
        renderJson(retResult);
    }

    private Map converTreeCombo(List<Department> list) {
        Map data = new HashMap();
        if (list.size() > 0) {
            String number = null;
            int level = 0;
            int startLen = ((Department) list.get(0)).getCode().length() - 1;
            int stepLen = 4;
            List<ComboTreeModel> levelList = null;
            for (Department depart : list) {
                number = depart.getLongnumber();
                level = (number.length() - startLen) / stepLen + 1;
                //department to comboTreeModel
                ComboTreeModel comboTreeModel = new ComboTreeModel();
                comboTreeModel.setId(depart.getId());
                comboTreeModel.setText(depart.getName());
                comboTreeModel.setIsleaf(depart.getLEAF());
                comboTreeModel.setLevel(Integer.valueOf(level));
                //is already exit the same level
                levelList = (List) data.get(Integer.valueOf(level));
                if (levelList == null) {
                    levelList = new ArrayList();
                    //start a new level
                    data.put(String.valueOf(level), levelList);
                }
                levelList.add(comboTreeModel);
            }
        }
        return data;
    }

    /**
     * 选择上级部门时搜索部门列表
     */
    @ApiOperation(value = "获取部门列表", httpMethod = "GET",
            notes = "获取部门列表,搜索参数q")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "q", value = "queryParm 搜索内容",
                    paramType = ParamType.QUERY, dataType = "string", required = false)
    })
    public void getDepartPage() {
        String queryParm = getPara("q");
        String page = getPara("page");
        String whereStr = getPara("id");
        int pageNumber = 1;
        if (StrKit.notBlank(page)) {
            pageNumber = Integer.parseInt(page);
        }
        Page<Department> list = departmentService.findPage(queryParm, pageNumber, 15, whereStr);
        renderJson(new BootstrapSelect2<Department>(list));
    }

    /**
     * 更新新增部门
     *
     * @param department
     */
    @ApiOperation(value = "更新或者新增部门", httpMethod = "POST", notes = "更新或者新增部门")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "Department field", value = "部门对象字段可使用?enable=1&leaf=1...测试接口",
                    paramType = ParamType.FORM, dataType = "string", required = true)
    })
    public void addOrUpdate(@Para("") Department department) {
        RestResult<String> restResult = new RestResult<String>();
        String parentNum = "";
        int parentid = department.getParentid();
        if (parentid != 0) { //has parent department? get parent department
            Department parent = departmentService.findById(department.getParentid());
            parentNum = parent.getLongnumber();
            department.setParentname(parent.getName());
        }
        if (department.getId() == null) {  //new deaprtment ?save
            String longnumber = LongNumberGenerator.departLNGenerator(parentNum);
            department.setLongnumber(longnumber);
            departmentService.save(department);
            restResult.success().setMsg("保存成功");
        } else { //else update department
            Department oldDepart = departmentService.findById(department.getId());
            restResult.success().setMsg("更新成功");
            //parentid is the same with old depart do not move depart node
            if (!oldDepart.getParentid().equals(department.getParentid())) {
                RestResult result = LongNumberGenerator.moveDepartNode(department.getId(), parentNum);
                if (result.getCode().equals(ResultCode.SUCCESS)) { // move department node success return new long number
                    department.setLongnumber((String) result.getData());
                } else {
                    restResult.success().setMsg(result.getMsg());
                }
            }
            departmentService.update(department);
        }
        renderJson(restResult);
    }
}
