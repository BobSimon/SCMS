package com.xmscltd.mp.plugin;

import com.jfinal.plugin.IPlugin;
import com.jfinal.weixin.sdk.api.ApiConfig;
import com.jfinal.weixin.sdk.api.ApiConfigKit;
import com.xmscltd.mp.utils.ApiConfigUtils;
import com.xmscltd.scms.base.model.Weixin;
import com.xmscltd.scms.base.service.WeixinService;
import io.jboot.Jboot;
import io.jboot.core.rpc.annotation.JbootrpcService;

import java.util.List;

/**
 * WeiXinPlugin Jboot启动时获取数据库的微信配置加入对象
 * com.xmscltd.scms.base.plugin.weixin
 * Created with IntelliJ IDEA.
 * Description:
 * Author: Administrator-cmchen
 * Date: 2018-03-20
 * Time: 16:41
 * Version: V1.0.0
 */
public class WeiXinPlugin implements IPlugin {


    @JbootrpcService
    private WeixinService weixinService;

    public WeiXinPlugin() {
        weixinService = Jboot.bean(WeixinService.class);
    }
    @Override
    public boolean start() {
        List<Weixin> list = weixinService.findAll();
        List<ApiConfig> acList = ApiConfigUtils.weiXinList2ApiConfigList(list);
        for (int i=0; i<acList.size(); i++){
            ApiConfigKit.putApiConfig(acList.get(i));
        }
        return true;
    }

    @Override
    public boolean stop() {
        return false;
    }
}
