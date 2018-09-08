package com.xmscltd.scms.admin.controller.system;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;

import com.jfinal.plugin.activerecord.Page;
import com.jfinal.upload.UploadFile;
import com.xmscltd.scms.base.common.RestResult;
import com.xmscltd.scms.base.model.User;
import com.xmscltd.scms.base.rest.datatable.BootStrapDataTable;
import com.xmscltd.scms.base.service.UserService;
import com.xmscltd.scms.base.web.base.BaseController;

import io.jboot.component.swagger.ParamType;
import io.jboot.core.rpc.annotation.JbootrpcService;
import io.jboot.web.controller.annotation.RequestMapping;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

/**
 * UserController
 * com.xmscltd.scms.admin.controller.system
 * Created with IntelliJ IDEA.
 * Description:
 * Author: Administrator-cmchen
 * Date: 2018-03-14
 * Time: 11:27
 * Version: V1.0.0
 */
@RequestMapping("/system/user")
@Api(description = "用户管理相关", basePath = "/system/user", tags = "用户管理接口")
public class UserController extends BaseController{

	@JbootrpcService
	private UserService userService;
	
    /**
     * 用户列表页面
     */
    public void index(){
        render("main.html");
    }

    /**
     * 获取用户列表
     */
    @ApiOperation(value  = "获取用户列表", httpMethod = "GET", notes = "获取用户列表接口")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "pageNumber", value = "页码", paramType = ParamType.PATH, dataType = "string", required = true),
            @ApiImplicitParam(name = "pageSize", value = "页内数据条数", paramType = ParamType.PATH, dataType = "string", required = true),
            @ApiImplicitParam(name = "sortName", value = "排序字段", paramType = ParamType.PATH, dataType = "string", required = false),
            @ApiImplicitParam(name = "sortOrder", value = "排序参数", paramType = ParamType.PATH, dataType = "string", required = false),
            @ApiImplicitParam(name = "searchText", value = "查询字段", paramType = ParamType.PATH, dataType = "string", required = false)
    })
    public void getUserList(){
        int pageNumber = getParaToInt("pageNumber");
        int pageSize = getParaToInt("pageSize");
        String sortName = getPara("sortName");
        String sortOrder = getPara("sortOrder");
        String searchText = getPara("searchText");
        
        Page<User> userPage = userService.findPage(pageNumber, pageSize,sortName,sortOrder,searchText);
        renderJson(new BootStrapDataTable<User>(userPage));
    }

    /**
     * 添加用户页面
     */
    public void addUser(){
        render("add.html");
    }

    /**
     * 提交新增用户
     */
    @SuppressWarnings("null")
	@ApiOperation(value  = "新增用户", httpMethod = "POST", notes = "表单新增用户接口")
    @ApiImplicitParams({
        @ApiImplicitParam(name = "username", value = "用户名", paramType = ParamType.FORM, dataType = "string", required = true),
        @ApiImplicitParam(name = "email", value = "Email 地址", paramType = ParamType.FORM, dataType = "string", required = true),
        @ApiImplicitParam(name = "password", value = "密码", paramType = ParamType.FORM, dataType = "string", required = true),
        @ApiImplicitParam(name = "avatar", value = "头像", paramType = ParamType.FORM, dataType = "string", required = false),
        @ApiImplicitParam(name = "firstName", value = "姓", paramType = ParamType.FORM, dataType = "string", required = true),
        @ApiImplicitParam(name = "lastName", value = "名", paramType = ParamType.FORM, dataType = "string", required = true),
        @ApiImplicitParam(name = "gender", value = "性别", paramType = ParamType.FORM, dataType = "string", required = true),
        @ApiImplicitParam(name = "credentialType", value = "证件类型", paramType = ParamType.FORM, dataType = "string", required = false),
        @ApiImplicitParam(name = "credentialNum", value = "证件号码", paramType = ParamType.FORM, dataType = "string", required = false),
        @ApiImplicitParam(name = "phoneNumber", value = "手机号码", paramType = ParamType.FORM, dataType = "string", required = true),
        @ApiImplicitParam(name = "birthday", value = "出生日期", paramType = ParamType.FORM, dataType = "string", required = true)
    })
    public void postAdd(){
    	
    	UploadFile file=getFile("avatar");	
    	
    	String username=getPara("username");
    	String email=getPara("email");
    	
    	String password=getPara("password");
    	String salt2 = new SecureRandomNumberGenerator().nextBytes().toHex();
        SimpleHash hash = new SimpleHash("md5", password, salt2, 2);
        password = hash.toHex();
        
        String fullName=getPara("fullname");
//        String lastName=getPara("lastName");
        Integer gender=getParaToInt("gender");
        Integer credentialType=getParaToInt("credentialType");
        String credentialNum=getPara("credentialNum");
        String phoneNumber=getPara("phoneNumber");
        String birthday=getPara("birthday");        
        
        RestResult<String> restResult = new RestResult<String>();
        restResult.success().setMsg("新增成功");
        try {
        	User user=new User();
        	user.setUsername(username);
        	user.setEmail(email);
        	user.setPwd(password);
        	user.setSalt2(salt2);
        	if(file!=null) {
    	    	String avatar="/upload/"+file.getFileName();
    	    	user.setAvatar(avatar);
        	}
        	user.setFullname(fullName);
        	user.setGender(gender);
        	user.setCredentialType(credentialType);
        	user.setCredentialNum(credentialNum);
        	user.setTelphone(phoneNumber);
        	
        	if(!birthday.equals("")) {
        		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        		Date date=sdf.parse(birthday);
        		user.setBirthday(date);
        	}
        	
        	userService.save(user);
        	
        	
        }catch (Exception e) {
        	e.printStackTrace();
            restResult.error("服务异常，请稍后重试");
		}
        
        renderJson(restResult);
    }

    /**
     * 用户表格快速更新名字
     */
    @ApiOperation(value  = "用户表格更新用户名", httpMethod = "POST", notes = "用户表格更新用户名接口")
    @ApiImplicitParams({
    	@ApiImplicitParam(name = "pk", value = "用户ID", paramType = ParamType.FORM, dataType = "string", required = true),
    	@ApiImplicitParam(name = "value", value = "用户名", paramType = ParamType.FORM, dataType = "string", required = true)
    })
    public void editName(){
        //String column = getPara("name");
        String id = getPara("pk");
        String newValue = getPara("value");
        
        User user=userService.findById(id);
        user.setUsername(newValue);
        userService.update(user);
        
        renderNull(); 
    }
    /**
     * 用户表格快速更新电话
     */
    @ApiOperation(value  = "用户表格更新电话", httpMethod = "POST", notes = "用户表格更新电话接口")
    @ApiImplicitParams({
    	@ApiImplicitParam(name = "pk", value = "用户ID", paramType = ParamType.FORM, dataType = "string", required = true),
    	@ApiImplicitParam(name = "value", value = "电话", paramType = ParamType.FORM, dataType = "string", required = true)
    })
    public void editTelphone(){
    	//String column = getPara("name");
        String id = getPara("pk");
        String newValue = getPara("value");
        
        User user=userService.findById(id);
        user.setTelphone(newValue);
        userService.update(user);
        
        renderNull();
    }
    /**
     * 用户表格快速更新备注
     */
    @ApiOperation(value  = "用户表格更新备注", httpMethod = "POST", notes = "用户表格更新备注接口")
    @ApiImplicitParams({
    	@ApiImplicitParam(name = "pk", value = "用户ID", paramType = ParamType.FORM, dataType = "string", required = true),
    	@ApiImplicitParam(name = "value", value = "备注", paramType = ParamType.FORM, dataType = "string", required = true)
    })
    public void editNote(){
    	//String column = getPara("name");
        String id = getPara("pk");
        String newValue = getPara("value");
        
        User user=userService.findById(id);
        user.setNote(newValue);
        userService.update(user);
        
        renderNull();
    }
    
    /**
     * 删除
     */
    @ApiOperation(value  = "删除用户", httpMethod = "GET", notes = "删除用户接口")
    @ApiImplicitParams({
    	@ApiImplicitParam(name = "ids", value = "ID字符串", paramType = ParamType.PATH, dataType = "string", required = true)
    })
    public void delete() {

    	String ids=getPara("ids");
    	String[] idsArr=ids.split(",");

    	String str="";
    	//遍历删除，将删除成功的返回
    	for(int i=0;i<idsArr.length;i++) {
    		if (userService.deleteById(idsArr[i])) {
                str+=idsArr[i]+",";
            }
    	}
    	renderText(str);
    }
    
    /**
     * 校验用户名是否已被占用
     */
    @ApiOperation(value  = "校验用户名是否重名", httpMethod = "POST", notes = "校验用户名重名接口")
    @ApiImplicitParams({
    	@ApiImplicitParam(name = "username", value = "用户名", paramType = ParamType.QUERY, dataType = "string", required = true)
    })
    public void checkUsername() {
    	 String username = getPara("username");
    	 if(userService.findByUserName(username)==null) {
    		 renderJson("valid",true);
    	 }else {
    		 renderJson("valid",false);
    	 }
    }

    /**
     * 根据id获取用户信息
     */
    @ApiOperation(value  = "根据id获取用户信息", httpMethod = "GET", notes = "根据id获取用户信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "用户id", paramType = ParamType.PATH, dataType = "string", required = true)
    })
    public void getUser() {
        String id = getPara("id");
        User user = userService.findById(id);
        renderJson(user);
    }
}
