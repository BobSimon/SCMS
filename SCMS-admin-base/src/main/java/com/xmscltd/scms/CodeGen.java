package com.xmscltd.scms;
import com.xmscltd.scms.base.gencode.model.AppModelGenerator;
import com.xmscltd.scms.base.gencode.service.AppServiceGenerator;
import com.xmscltd.scms.base.gencode.serviceimpl.AppServiceImplGenerator;

/**
 * CodeGen model层和Service层 基础代码生成器
 * com.xmscltd.scms
 * Created with IntelliJ IDEA.
 * Description:
 * Author: Administrator-cmchen
 * Date: 2018-02-22
 * Time: 14:24
 * Version: V1.0.0
 */
public class CodeGen {

    public static void main(String[] args){
        genModel();
        genService();
        genServiceImpl();
    }

    /**
     * 生成model
     */
    public static void genModel(){

        AppModelGenerator.doGenerate();
    }
    /**
     * 生成service
     */
    public static void genService(){

        AppServiceGenerator.doGenerate();
    }

    /**
     * 生成serviceImpl
     */
    public static void genServiceImpl(){

        AppServiceImplGenerator.doGenerate();
    }

}
