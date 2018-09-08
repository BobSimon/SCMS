package com.xmscltd.scms.admin.support.auth;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.xmscltd.scms.status.system.ResStatus;
import io.jboot.Jboot;
import com.xmscltd.scms.base.service.ResService;
import com.xmscltd.scms.base.model.Res;
import org.apache.shiro.SecurityUtils;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * 根据url的权限拦截器，具有url权限的用户才允许访问
 * @author Rlax
 *
 */
public class AuthInterceptor implements Interceptor {

    /**
     * 获取全部 需要控制的权限
     */
    private static List<String> urls;

    public AuthInterceptor() {

    }

    public static List<String> getUrls() {
        return urls;
    }

    /**
     * 初始化需要控制权限的url
     */
    public static void init() {
        ResService sysResApi = Jboot.service(ResService.class);
        List<Res> sysResList = sysResApi.findByStatus(ResStatus.USED);

        List<String> list = new ArrayList<>();

        for (Res res : sysResList) {
            String urlString = res.getUrl();

            //判断多重权限 /system/res/add;/system/res/add/postadd
            if(urlString.contains(";")){
               String url[]  =  urlString.split(";");

               for(int i=0; i<url.length;i++){
                   list.add(url[i]);
               }
            }else{
                list.add(res.getUrl());
            }
        }
        urls = list;
    }


    @Override
    public void intercept(Invocation ai) {
        if (urls == null) {
            init();
        }

        String url = ai.getActionKey();
        //用户是否拥有访问改url的权限
        boolean flag = SecurityUtils.getSubject() != null && SecurityUtils.getSubject().isPermitted(url);
        //urls.contains(url) url 是否需要授权控制
        if (urls.contains(url) && !flag) {
            ai.getController().renderError(403);
        } else {
            ai.invoke();
        }
    }

}
