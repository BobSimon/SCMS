package com.xmscltd.scms.base.service.impl;

import com.jfinal.weixin.sdk.api.ApiConfig;
import io.jboot.aop.annotation.Bean;
import com.xmscltd.scms.base.service.WeixinService;
import com.xmscltd.scms.base.model.Weixin;
import io.jboot.core.rpc.annotation.JbootrpcService;
import io.jboot.service.JbootServiceBase;

import javax.inject.Singleton;

@Bean
@Singleton
@JbootrpcService
public class WeixinServiceImpl extends JbootServiceBase<Weixin> implements WeixinService {


    @Override
    public Weixin findByappId(Object appId) {
        return DAO.findFirstByColumn("wxappid",appId);
    }
}