package com.xmscltd.scms.base.service.impl;

import io.jboot.aop.annotation.Bean;
import com.xmscltd.scms.base.service.UserResService;
import com.xmscltd.scms.base.model.UserRes;
import io.jboot.core.rpc.annotation.JbootrpcService;
import io.jboot.service.JbootServiceBase;

import javax.inject.Singleton;

@Bean
@Singleton
@JbootrpcService
public class UserResServiceImpl extends JbootServiceBase<UserRes> implements UserResService {

}