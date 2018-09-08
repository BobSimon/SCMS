package com.xmscltd.scms.admin.config;

import com.google.inject.Binder;
import com.jfinal.captcha.CaptchaManager;
import com.jfinal.config.Constants;
import com.jfinal.config.Interceptors;
import com.jfinal.config.Routes;
import com.jfinal.ext.handler.ContextPathHandler;
import com.jfinal.i18n.I18nInterceptor;
import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;
import com.jfinal.template.Engine;
import com.jfinal.weixin.sdk.api.ApiConfig;
import com.jfinal.weixin.sdk.api.ApiConfigKit;
import com.sun.imageio.plugins.common.I18N;
import com.xmscltd.mp.plugin.WeiXinPlugin;
import com.xmscltd.scms.admin.support.auth.AuthInterceptor;
import com.xmscltd.scms.admin.support.log.LogInterceptor;
import com.xmscltd.scms.base.interceptor.BusinessExceptionInterceptor;
import com.xmscltd.scms.base.interceptor.NotNullParaInterceptor;
import com.xmscltd.scms.base.plugin.quartz.QuartzPlugin;
import com.xmscltd.scms.base.web.render.AppRenderFactory;
import io.jboot.Jboot;
import io.jboot.aop.jfinal.JfinalHandlers;
import io.jboot.aop.jfinal.JfinalPlugins;
import io.jboot.server.ContextListeners;
import io.jboot.server.JbootServer;
import io.jboot.server.Servlets;
import io.jboot.server.listener.JbootAppListenerBase;
import com.xmscltd.scms.base.common.AppInfo;

import java.util.List;

/**
 * JfinalConfigListener
 * com.xmscltd.scms.admin.config
 * Created with IntelliJ IDEA.
 * Description:
 * Author: Administrator-cmchen
 * Date: 2018-02-22
 * Time: 14:24
 * Version: V1.0.0
 */
public class JfinalConfigListener extends JbootAppListenerBase {
    @Override
    public void onJfinalConstantConfig(Constants constants) {
        constants.setError401View("/template/401.html");
        constants.setError403View("/template/403.html");
        constants.setError404View("/template/404.html");
        constants.setError500View("/template/500.html");
        constants.setRenderFactory(new AppRenderFactory());
    }

    @Override
    public void onJfinalRouteConfig(Routes routes) {
        routes.setBaseViewPath("/template");
    }

    @Override
    public void onJfinalEngineConfig(Engine engine) {
        engine.setDevMode(true);
        AppInfo app = Jboot.config(AppInfo.class);
        engine.addSharedObject("APP", app);
        engine.addSharedObject("RESOURCE_HOST", app.getResourceHost());

    }

    @Override
    public void onInterceptorConfig(Interceptors interceptors) {
//        interceptors.add(new LogInterceptor());
        interceptors.add(new AuthInterceptor());
        interceptors.add(new NotNullParaInterceptor("/template/500.html"));
        interceptors.add(new BusinessExceptionInterceptor("/template/500.html"));

        interceptors.add(new I18nInterceptor());
    }

    @Override
    public void onJfinalPluginConfig(JfinalPlugins plugins) {
        //定时器插件 启动时自动继续去中断 的定时
        QuartzPlugin quartzPlugin = new QuartzPlugin();
        plugins.add(quartzPlugin);
        //微信插件 自动将数据库的公众号配置对象加入
        WeiXinPlugin weixinPlugin = new WeiXinPlugin();
        plugins.add(weixinPlugin);

    }

    @Override
    public void onHandlerConfig(JfinalHandlers handlers) {
        handlers.add(new ContextPathHandler("ctxPath"));
    }

    @Override
    public void onJFinalStarted() {

    }

    @Override
    public void onJFinalStop() {
//        QuartzPlugin qm = new QuartzPlugin();
//        qm.shutdown();
    }

    @Override
    public void onJbootStarted() {
        /** 集群模式下验证码使用 redis 缓存 */
//        CaptchaManager.me().setCaptchaCache(new CaptchaCache());
//        QuartzPlugin qm = new QuartzPlugin();
//        qm.initJob();
    }

    @Override
    public void onAppStartBefore(JbootServer jbootServer) {

    }

    @Override
    public void onJbootDeploy(Servlets servlets, ContextListeners listeners) {

    }

    @Override
    public void onGuiceConfigure(Binder binder) {

    }

}
