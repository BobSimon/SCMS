package com.xmscltd.scms.admin.controller.system;

import com.jfinal.plugin.activerecord.Page;
import com.xmscltd.scms.base.model.Log;
import com.xmscltd.scms.base.rest.datatable.BootStrapDataTable;
import com.xmscltd.scms.base.service.LogService;
import com.xmscltd.scms.base.web.base.BaseController;

import io.jboot.component.swagger.ParamType;
import io.jboot.core.rpc.annotation.JbootrpcService;
import io.jboot.web.controller.annotation.RequestMapping;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

/**
 * LogController
 * com.xmscltd.scms.admin.controller.system
 * Created with IntelliJ IDEA.
 * Description:
 * Author: Administrator-cmchen
 * Date: 2018-02-27
 * Time: 9:24
 * Version: V1.0.0
 */
@RequestMapping("/system/log")
@Api(description = "日志管理相关", basePath = "/system/log", tags = "日志管理接口")
public class LogController extends BaseController {
	
	@JbootrpcService
    private LogService logService;
	
    public void index() {
        render("main.html");
    }
    
    /**
     * 获取日志列表
     */
    @ApiOperation(value  = "获取日志列表", httpMethod = "GET", notes = "获取日志列表接口")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "pageNumber", value = "页码", paramType = ParamType.PATH, dataType = "string", required = true),
            @ApiImplicitParam(name = "pageSize", value = "页内数据条数", paramType = ParamType.PATH, dataType = "string", required = true),
            @ApiImplicitParam(name = "sortName", value = "排序字段", paramType = ParamType.PATH, dataType = "string", required = false),
            @ApiImplicitParam(name = "sortOrder", value = "排序参数", paramType = ParamType.PATH, dataType = "string", required = false),
            @ApiImplicitParam(name = "searchText", value = "查询字段", paramType = ParamType.PATH, dataType = "string", required = false)
    })
    public void getLogList() {
    	int pageNumber = getParaToInt("pageNumber");
        int pageSize = getParaToInt("pageSize");
        String sortName = getPara("sortName");
        String sortOrder = getPara("sortOrder");
        String searchText = getPara("searchText");
        
        Page<Log> logPage = logService.findPage(pageNumber, pageSize,sortName,sortOrder,searchText);
        renderJson(new BootStrapDataTable<Log>(logPage));
    }
    
    /**
     * 删除
     */
    @ApiOperation(value  = "删除日志", httpMethod = "GET", notes = "删除日志接口")
    @ApiImplicitParams({
        @ApiImplicitParam(name = "ids", value = "ID字符串", paramType = ParamType.PATH, dataType = "string", required = true)
    })
    public void delete() {

    	String ids=getPara("ids");
    	String[] idsArr=ids.split(",");

    	String str="";
    	//遍历删除，将删除成功的返回
    	for(int i=0;i<idsArr.length;i++) {
    		if (logService.deleteById(idsArr[i])) {
                str+=idsArr[i]+",";
            }
    	}
    	renderText(str);
    }
}
