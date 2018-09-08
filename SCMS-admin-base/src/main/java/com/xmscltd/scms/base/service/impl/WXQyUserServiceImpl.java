package com.xmscltd.scms.base.service.impl;

import io.jboot.aop.annotation.Bean;
import com.xmscltd.scms.base.service.WXQyUserService;
import com.xmscltd.scms.base.model.WXQyUser;
import io.jboot.core.rpc.annotation.JbootrpcService;
import io.jboot.service.JbootServiceBase;

import javax.inject.Singleton;

@Bean
@Singleton
@JbootrpcService
public class WXQyUserServiceImpl extends JbootServiceBase<WXQyUser> implements WXQyUserService {

}