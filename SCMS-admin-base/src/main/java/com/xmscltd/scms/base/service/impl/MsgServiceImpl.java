package com.xmscltd.scms.base.service.impl;

import io.jboot.aop.annotation.Bean;
import com.xmscltd.scms.base.service.MsgService;
import com.xmscltd.scms.base.model.Msg;
import io.jboot.core.rpc.annotation.JbootrpcService;
import io.jboot.service.JbootServiceBase;

import javax.inject.Singleton;
import java.util.List;

@Bean
@Singleton
@JbootrpcService
public class MsgServiceImpl extends JbootServiceBase<Msg> implements MsgService {

    @Override
    public List<Msg> findByReceiverId(int id) {
        return null;
    }

    @Override
    public List<Msg> findBySender(String senderName, Object id) {
        return null;
    }

    @Override
    public List<Msg> findByKeyWord(String keyWord, Object id) {
        return null;
    }
}