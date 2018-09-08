package com.xmscltd.scms.base.service.impl;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Page;
import com.xmscltd.scms.base.model.Res;
import com.xmscltd.scms.status.system.ResStatus;
import io.jboot.aop.annotation.Bean;
import com.xmscltd.scms.base.service.DepartmentService;
import com.xmscltd.scms.base.model.Department;
import io.jboot.core.rpc.annotation.JbootrpcService;
import io.jboot.db.model.Column;
import io.jboot.db.model.Columns;
import io.jboot.service.JbootServiceBase;

import javax.inject.Singleton;
import java.util.List;

@Bean
@Singleton
@JbootrpcService
public class DepartmentServiceImpl extends JbootServiceBase<Department> implements DepartmentService {

    @Override
    public List<Department> findByParentId(Object id) {
        Columns columns = Columns.create();
        columns.eq("parentid", id);
        return DAO.findListByColumns(columns, "code desc");
    }

    @Override
    public List<Department> findListOrderByColumn(String Column) {
        return DAO.find("select * from sys_department order by "+Column);
    }

    @Override
    public Page<Department> findPage(String queryParm, int pageNumber, int pageSize, String whereStr) {

        Columns columns = Columns.create();
        if (StrKit.notBlank(queryParm)) {
            columns.like("name", "%"+queryParm+"%");
        }
        if (StrKit.notBlank(whereStr)) {
            columns.ne("id", whereStr);
        }
        columns.ne("enable", 0);
        return DAO.paginateByColumns(pageNumber, pageSize, columns.getList(), "longnumber desc");
    }


}