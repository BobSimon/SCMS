package com.xmscltd.scms.admin.controller;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.subject.Subject;

import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.POST;
import com.xmscltd.scms.admin.support.auth.AuthUtils;
import com.xmscltd.scms.admin.validator.LoginValidator;
import com.xmscltd.scms.base.common.Consts;
import com.xmscltd.scms.base.common.MenuItem;
import com.xmscltd.scms.base.common.RestResult;
import com.xmscltd.scms.base.model.Res;
import com.xmscltd.scms.base.model.User;
import com.xmscltd.scms.base.plugin.shiro.MuitiLoginToken;
import com.xmscltd.scms.base.service.ResService;
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
 * 主控制器
 * @author Rlax
 *
 */
@RequestMapping("/")
@Api(description = "用户登陆退出相关", basePath = "/", tags = "登陆退出接口")
public class MainController extends BaseController {

    @JbootrpcService
    private UserService userService;
    @JbootrpcService
	private ResService resService;

    /**
     * 后台首页
     */

    public void index() {
    	User user = AuthUtils.getLoginUser();
		List<Res> list = resService.findMenuByUserId(user.getId());
		
		List<MenuItem> listL1 = null;
        for (Res l1 : list) {
            if (l1.getLevel() == 2) {
                if (listL1 == null) {
                    listL1 = new LinkedList<MenuItem>();
                }
                MenuItem l1Item = new MenuItem(l1.getName(), l1.getIconCls(), l1.getUrl(), l1.getId());
                List<MenuItem> subset = null;
                for (Res l2 : list) {
                    if (l2.getLevel() == 3 && l2.getPid().equals(l1.getId())) {
                        if (subset == null) {
                            subset = new LinkedList<MenuItem>();
                        }
                        MenuItem l2Item = new MenuItem(l2.getName(), l2.getIconCls(), l2.getUrl(), l2.getId());
						List<MenuItem> subset2 = null;
						for (Res l3 : list) {
							if (l3.getLevel() == 4 && l3.getPid().equals(l2.getId())) {
								if (subset2 == null) {
									subset2 = new LinkedList<MenuItem>();
								}
								MenuItem l3Item = new MenuItem(l3.getName(), l3.getIconCls(), l3.getUrl(), l3.getId());								
								subset2.add(l3Item);
							}								
						}	
                        l2Item.setSubset(subset2);
                        subset.add(l2Item);
                    }
                }
                l1Item.setSubset(subset);
                listL1.add(l1Item);
            }
        }
		//List<MenuItem> listL1=MenuUtil.createMenu(list, 2, 1L);
        
		
        Map<String, List<MenuItem>> menu = new HashMap<String, List<MenuItem>>();
        menu.put("data", listL1);
    	setAttr("menu", menu);
        setAttr("user",user);
        render("index.html");
    }

    /**
     * 登陆页面
     */
    public void login() {
        if (SecurityUtils.getSubject().isAuthenticated()) {
            redirect("/");
        } else {
            render("login.html");
        }
    }

    public void captcha() {
        renderCaptcha();
    }

    /**
     * 登陆
     */
    @Before( {POST.class, LoginValidator.class} )
    @ApiOperation(value  = "登陆", httpMethod = "POST", notes = "用户登陆接口,rememberMe=='on' 记住我")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "loginName", value = "用户名", paramType = ParamType.FORM, dataType = "string", required = true),
            @ApiImplicitParam(name = "password", value = "密码", paramType = ParamType.FORM, dataType = "string", required = true),
            @ApiImplicitParam(name = "rememberMe", value = "是否记住我", paramType = ParamType.FORM, dataType = "string", defaultValue = "off", required = true)
    })
    public void postLogin() {
        String loginName = getPara("loginName");
        String pwd = getPara("password");
        String rememberMe = getPara("rememberMe");

        MuitiLoginToken token = null;
        Subject subject = SecurityUtils.getSubject();

        RestResult<String> restResult = new RestResult<String>();
        restResult.success().setMsg("登录成功");

        try {
            if (!subject.isAuthenticated()) {
                //记住我登陆
                if (rememberMe != null && "on".equals(rememberMe)) {
                    token = new MuitiLoginToken(loginName, pwd,true);
                } else {
                //没有记住我
                    removeCookie("rememberMe");
                    token = new MuitiLoginToken(loginName, pwd);
                }

                subject.login(token);
                User u = userService.findByUserName(loginName);
                subject.getSession(true).setAttribute(Consts.SESSION_USER, u);

                /*Map<String, Object> jwtMap = new HashMap<String, Object>();
                jwtMap.put("sysuser", loginName);
                JwtManager jwt = new JwtManager();
                String jwtToken = jwt.createJwtToken(jwtMap);
                setSessionAttr("jwtToken",jwtToken);*/
                setJwtAttr("version", "V1.0");
                setJwtAttr("userId", u.getId().toString());
                setAttr("userid",u.getId().toString());
            }

        } catch (UnknownAccountException une) {
            restResult.error("用户名不存在");
        } catch (LockedAccountException lae) {
            restResult.error("用户被锁定");
        } catch (IncorrectCredentialsException ine) {
            restResult.error("用户名或密码不正确");
        } catch (ExcessiveAttemptsException exe) {
            restResult.error("账户密码错误次数过多，账户已被限制登录1小时");
        } catch (Exception e) {
            e.printStackTrace();
            restResult.error("服务异常，请稍后重试");
        }

        renderJson(restResult);
    }

    /**
     * 退出
     * 记住我、授权认证登临主动退出登陆后都清楚Cookie
     */
    @ApiOperation(value  = "退出登陆", httpMethod = "GET", notes = "退出登陆接口")
    public void logout() {
//        if (SecurityUtils.getSubject().isAuthenticated()) {
            //记住我、授权认证登临主动退出登陆后都清楚Cookie
            removeCookie("rememberMe");
            SecurityUtils.getSubject().logout();
//        }
        render("login.html");
    }

    /**
     * 登陆页面
     */
    public void im() {
        User user = AuthUtils.getLoginUser();
        setAttr("uid",user.getId());
            render("im.html");
    }

}
