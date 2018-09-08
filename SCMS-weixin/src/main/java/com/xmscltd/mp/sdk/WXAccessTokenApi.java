package com.xmscltd.mp.sdk;

import com.jfinal.kit.StrKit;
import com.jfinal.weixin.sdk.api.AccessToken;
import com.jfinal.weixin.sdk.api.AccessTokenApi;
import com.jfinal.weixin.sdk.api.ApiConfig;
import com.jfinal.weixin.sdk.api.ApiConfigKit;
import com.jfinal.weixin.sdk.cache.IAccessTokenCache;

/**
 * AccessTokenApi 通过ApiConfig 获取AccessToken 方便多公众号使用
 * com.xmscltd.mp.sdk
 * Created with IntelliJ IDEA.
 * Description:
 * Author: Administrator-cmchen
 * Date: 2018-03-19
 * Time: 16:26
 * Version: V1.0.0
 */
public class WXAccessTokenApi extends AccessTokenApi {

    /**
     * 从缓存中获取 access token，如果未取到或者 access token 不可用则先更新再获取
     * @return AccessToken accessToken
     */
    public static AccessToken getAccessToken(ApiConfig ac) {
//        ApiConfig ac = ApiConfigKit.getApiConfig();
        AccessToken result = getAvailableAccessToken(ac);
        if (result != null) {
            return result;
        }

        return refreshAccessTokenIfNecessary(ac);
    }

    private static AccessToken getAvailableAccessToken(ApiConfig ac) {
        // 利用 appId 与 accessToken 建立关联，支持多账户
        IAccessTokenCache accessTokenCache = ApiConfigKit.getAccessTokenCache();

        String accessTokenJson = accessTokenCache.get(ac.getAppId());
        if (StrKit.notBlank(accessTokenJson)) {
            AccessToken result = new AccessToken(accessTokenJson);
            if (result != null && result.isAvailable()) {
                return result;
            }
        }
        return null;
    }

    /**
     * synchronized 配合再次获取 token 并检测可用性，防止多线程重复刷新 token 值
     */
    private static synchronized AccessToken refreshAccessTokenIfNecessary(ApiConfig ac) {
        AccessToken result = getAvailableAccessToken(ac);
        if (result != null) {
            return result;
        }
        return refreshAccessToken(ac);
    }
}
