package com.xmscltd.scms.base.service.impl;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.xmscltd.scms.base.model.WXUser;
import io.jboot.aop.annotation.Bean;
import io.jboot.core.rpc.annotation.JbootrpcService;

import com.xmscltd.scms.base.service.WXUserService;
import io.jboot.service.JbootServiceBase;


import javax.inject.Singleton;

@Bean
@Singleton
@JbootrpcService
public class WXUserServiceImpl extends JbootServiceBase<WXUser> implements WXUserService {

    @Override
    public WXUser findByUserId(Object userId) {
        return DAO.findFirstByColumn("userid",userId);
    }

    @Override
    public WXUser findByUnionid(Object unionid) {
        return DAO.findFirstByColumn("unionid",unionid);
    }

    @Override
    public String getOpenidByUserId(Object userId) {
    	String sql = "SELECT m.openid from sys_wxma_user m INNER JOIN sys_wxuser u on u.unionid=m.unionid where u.userid=?";
    	Record record = Db.findFirst(sql,userId);
    	return record.get("openid").toString();
    }

}