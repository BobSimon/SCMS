package com.xmscltd.scms.base.service.impl;

import io.jboot.aop.annotation.Bean;
import com.xmscltd.scms.base.service.DataService;
import com.xmscltd.scms.base.model.Data;
import io.jboot.core.rpc.annotation.JbootrpcService;
import io.jboot.service.JbootServiceBase;

import javax.inject.Singleton;

@Bean
@Singleton
@JbootrpcService
public class DataServiceImpl extends JbootServiceBase<Data> implements DataService {

}