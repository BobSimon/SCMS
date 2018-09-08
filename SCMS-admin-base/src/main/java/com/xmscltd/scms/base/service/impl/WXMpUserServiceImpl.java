package com.xmscltd.scms.base.service.impl;

import com.xmscltd.scms.base.model.WXMpUser;
import io.jboot.aop.annotation.Bean;
import com.xmscltd.scms.base.service.WXMpUserService;
import io.jboot.core.rpc.annotation.JbootrpcService;
import io.jboot.service.JbootServiceBase;


import javax.inject.Singleton;

@Bean
@Singleton
@JbootrpcService
public class WXMpUserServiceImpl extends JbootServiceBase<WXMpUser> implements WXMpUserService {

    @Override
    public WXMpUser findByUnionId(Object unionId) {
        return null;
    }
}