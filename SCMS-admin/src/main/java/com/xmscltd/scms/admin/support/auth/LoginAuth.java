package com.xmscltd.scms.admin.support.auth;

import com.xmscltd.scms.base.service.RoleService;
import com.xmscltd.scms.base.service.UserService;
import com.xmscltd.scms.status.system.UserStatus;
import io.jboot.Jboot;
import com.xmscltd.scms.base.plugin.shiro.auth.MuitiAuthenticatied;
import com.xmscltd.scms.base.service.ResService;
import com.xmscltd.scms.base.model.Res;
import com.xmscltd.scms.base.model.Role;
import com.xmscltd.scms.base.model.User;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

import java.util.ArrayList;
import java.util.List;

/**
 * 管理端认证授权
 * @author Rlax
 *
 */
public class LoginAuth implements MuitiAuthenticatied {

    @Override
    public boolean hasToken(AuthenticationToken authenticationToken) {
        String loginName = authenticationToken.getPrincipal().toString();
        UserService sysUserApi = Jboot.service(UserService.class);
        return sysUserApi.hasUser(loginName);
    }

    @Override
    public boolean wasLocked(AuthenticationToken authenticationToken) {
        String loginName = authenticationToken.getPrincipal().toString();

        UserService sysUserApi = Jboot.service(UserService.class);
        User sysUser = sysUserApi.findByUserName(loginName);
        return !sysUser.getStatus().equals(UserStatus.USED);
    }

    @Override
    public AuthenticationInfo buildAuthenticationInfo(AuthenticationToken authenticationToken) {
        String loginName = authenticationToken.getPrincipal().toString();

        UserService sysUserApi = Jboot.service(UserService.class);
        User sysUser = sysUserApi.findByUserName(loginName);
        String salt2 = sysUser.getSalt2();
        String pwd = sysUser.getPwd();

        return new SimpleAuthenticationInfo(loginName, pwd, ByteSource.Util.bytes(salt2), "ShiroDbRealm");
    }

    @Override
    public AuthorizationInfo buildAuthorizationInfo(PrincipalCollection principals) {
        String loginName = (String) principals.fromRealm("ShiroDbRealm").iterator().next();

        ResService sysRoleApi = Jboot.service(ResService.class);
        List<Res> sysResList = sysRoleApi.findMenuByUserName(loginName);
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();

//        List<String> roleNameList = new ArrayList<String>();
//        for (Res sysRes : sysRoleList) {
//            roleNameList.add(sysRes.getName());
//        }
//
//        ResService sysResService = Jboot.service(ResService.class);
//        List<Res> sysResList = sysResService.findByUserNameAndStatusUsed(loginName);
        List<String> urls = new ArrayList<String>();
        for (Res sysRes : sysResList) {
            urls.add(sysRes.getUrl());
        }

//        info.addRoles(roleNameList);
        info.addStringPermissions(urls);
        return info;
    }
}
