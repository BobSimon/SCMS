package com.xmscltd.mp.controller;

import com.alibaba.fastjson.JSONObject;
import com.jfinal.weixin.sdk.api.ApiConfig;
import com.jfinal.weixin.sdk.api.ApiConfigKit;
import com.jfinal.weixin.sdk.api.ApiResult;
import com.jfinal.weixin.sdk.api.UserApi;
import com.jfinal.weixin.sdk.jfinal.ApiController;
import com.xmscltd.mp.sdk.WXAccessTokenApi;
import com.xmscltd.scms.base.service.WeixinService;
import com.xmscltd.scms.base.web.base.BaseController;
import io.jboot.core.rpc.annotation.JbootrpcService;
import io.jboot.web.controller.annotation.RequestMapping;
import io.jboot.wechat.controller.JbootWechatController;

/**
 * test
 * com.xmscltd.mp.controller
 * Created with IntelliJ IDEA.
 * Description:
 * Author: Administrator-cmchen
 * Date: 2018-03-20
 * Time: 13:58
 * Version: V1.0.0
 */
@RequestMapping("/wxapi/test")
public class test extends ApiController {
    @JbootrpcService
    private WeixinService weixinService;
    public void index(){
//        WXAccessTokenApi.getAccessToken(weixinService.findApiConfigByappId("wx5a52ad06bec8e16d"));
//        ApiConfigKit.setThreadLocalAppId("wx5a52ad06bec8e16d");
        ApiResult apiResult = UserApi.getUserInfo("oZ0CZ05eUwvC58dfNewcaFNmtkBA");
        JSONObject json = JSONObject.parseObject(apiResult.getJson());
        renderText(json.getString("nickname")+"----"+json.getBoolean("subscribe"));
    }

    public void addconfig(){
        ApiConfig ac = new ApiConfig();

        // 配置微信 API 相关常量
        ac.setToken("token");
        ac.setAppId("wx5a52ad06bec8e16d");
        ac.setAppSecret("194d962b0bb2c6daee9a41f177e2fe05");

        /**
         * 是否对消息进行加密，对应于微信平台的消息加解密方式： 1：true进行加密且必须配置 encodingAesKey
         * 2：false采用明文模式，同时也支持混合模式
         */
        ac.setEncryptMessage(false);
        ac.setEncodingAesKey("setting it in config file");
//        return ac;
        ApiConfigKit.putApiConfig(ac);
    }

}
