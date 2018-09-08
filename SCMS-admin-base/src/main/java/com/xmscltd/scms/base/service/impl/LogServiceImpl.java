package com.xmscltd.scms.base.service.impl;

import javax.inject.Singleton;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Page;
import com.xmscltd.scms.base.model.Log;
import com.xmscltd.scms.base.service.LogService;

import io.jboot.aop.annotation.Bean;
import io.jboot.core.rpc.annotation.JbootrpcService;
import io.jboot.db.model.Column;
import io.jboot.db.model.Columns;
import io.jboot.service.JbootServiceBase;

@Bean
@Singleton
@JbootrpcService
public class LogServiceImpl extends JbootServiceBase<Log> implements LogService {
	@Override
	public Page<Log> findPage(int pageNumber, int pageSize, String sortName, String sortOrder,String searchText) {
		if(searchText!=null) {
			Columns columns = Columns.create();
			columns.like("lastUpdAcct", "%"+searchText+"%");
			return DAO.paginateByColumns(pageNumber, pageSize, columns.getList(), sortName + " " + sortOrder);
		}else {
			return DAO.paginate(pageNumber, pageSize, sortName + " " + sortOrder);
		}
	}

}