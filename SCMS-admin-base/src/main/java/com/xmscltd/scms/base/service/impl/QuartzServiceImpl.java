package com.xmscltd.scms.base.service.impl;

import java.util.List;

import javax.inject.Singleton;

import com.jfinal.plugin.activerecord.Page;
import com.xmscltd.scms.base.model.Quartz;
import com.xmscltd.scms.base.service.QuartzService;

import io.jboot.aop.annotation.Bean;
import io.jboot.core.rpc.annotation.JbootrpcService;
import io.jboot.db.model.Columns;
import io.jboot.service.JbootServiceBase;

/**
 * QuartzServiceImpl
 * com.xmscltd.scms.base.service.impl
 * Created with IntelliJ IDEA.
 * Description:
 * Author: Administrator-cmchen
 * Date: 2018-03-02
 * Time: 15:52
 * Version: V1.0.0
 */
@Bean
@Singleton
@JbootrpcService
public class QuartzServiceImpl extends JbootServiceBase<Quartz> implements QuartzService {
    @Override
    public Page<Quartz> findPage(Quartz sysQuartz, int pageNumber, int pageSize) {
        return null;
    }

    @Override
    public Quartz findByJobNameAndJobGroup(String jobName,String jobGroup) {
    	Columns columns = Columns.create();
    	columns.eq("jobName", jobName);
    	columns.eq("jobGroup", jobGroup);
        return DAO.findFirstByColumns(columns);
    }

    @Override
    public Page<Quartz> findPage(int pageNumber, int pageSize, String sortName,  String sortOrder, String searchText) {
    	if(searchText!=null) {
			Columns columns = Columns.create();
			columns.like("jobName", "%"+searchText+"%");
			return DAO.paginateByColumns(pageNumber, pageSize, columns.getList(), sortName + " " + sortOrder);
		}else {
			return DAO.paginate(pageNumber, pageSize, sortName + " " + sortOrder);
		}
    }
}
