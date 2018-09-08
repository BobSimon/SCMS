package com.xmscltd.scms.base.service.impl;

import com.xmscltd.scms.base.model.WXMaUser;
import com.xmscltd.scms.base.service.WXMaUserService;

import io.jboot.aop.annotation.Bean;
import io.jboot.core.rpc.annotation.JbootrpcService;
import io.jboot.service.JbootServiceBase;

import javax.inject.Singleton;

@Bean
@Singleton
@JbootrpcService
public class WXMaUserServiceImpl extends JbootServiceBase<WXMaUser> implements WXMaUserService {

}