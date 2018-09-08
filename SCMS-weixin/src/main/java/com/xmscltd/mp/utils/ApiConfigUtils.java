package com.xmscltd.mp.utils;

import com.jfinal.weixin.sdk.api.ApiConfig;
import com.xmscltd.scms.base.model.Weixin;

import java.util.ArrayList;
import java.util.List;

/**
 * ApiConfigUtils
 * com.xmscltd.mp.utils
 * Created with IntelliJ IDEA.
 * Description:
 * Author: Administrator-cmchen
 * Date: 2018-03-20
 * Time: 16:23
 * Version: V1.0.0
 */
public class ApiConfigUtils {

    /**
     * 微信设置转ApiConfig
     * @param weixin
     * @return
     */
    public static ApiConfig weiXin2ApiConfig(Weixin weixin){
        ApiConfig ac = new ApiConfig();
        if(weixin != null){
            ac.setAppId(weixin.getWxappid());
            ac.setAppSecret(weixin.getWxappsecret());
            ac.setToken(weixin.getWxtoken());
            ac.setEncodingAesKey(weixin.getEncodingAesKey());
            ac.setEncryptMessage(weixin.getMessageEncrypt());
        }
        return ac;
    }

    public static List<ApiConfig> weiXinList2ApiConfigList(List<Weixin> weixin){
        List acList = new ArrayList();
        for (int i = 0; i<weixin.size(); i++){
            ApiConfig ac = weiXin2ApiConfig(weixin.get(i));
            acList.add(ac);
        }
        return acList;
    }
}
