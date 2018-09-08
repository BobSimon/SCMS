package com.xmscltd.scms.base.service;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.xmscltd.scms.base.model.Department;
import com.xmscltd.scms.base.model.Res;

import java.util.List;

public interface DepartmentService  {


    /**
     * findListOrderByColumn
     *
     * @param Column
     * @return
     */
    public List<Department> findListOrderByColumn(String Column);

    /**
     * findForPage
     *
     * @param queryParm
     * @return
     */
    public Page<Department> findPage(String queryParm, int pageNumber, int pageSize, String whereStr);

    /**
     * find model by primary key
     *
     * @param id
     * @return
     */
    public List<Department> findByParentId(Object id);

    /**
     * find model by primary key
     *
     * @param id
     * @return
     */
    public Department findById(Object id);


    /**
     * find all model
     *
     * @return all <Department
     */
    public List<Department> findAll();


    /**
     * delete model by primary key
     *
     * @param id
     * @return success
     */
    public boolean deleteById(Object id);


    /**
     * delete model
     *
     * @param model
     * @return
     */
    public boolean delete(Department model);


    /**
     * save model to database
     *
     * @param model
     * @return
     */
    public boolean save(Department model);


    /**
     * save or update model
     *
     * @param model
     * @return if save or update success
     */
    public boolean saveOrUpdate(Department model);


    /**
     * update data model
     *
     * @param model
     * @return
     */
    public boolean update(Department model);


    public void join(Page<? extends Model> page, String joinOnField);
    public void join(Page<? extends Model> page, String joinOnField, String[] attrs);
    public void join(Page<? extends Model> page, String joinOnField, String joinName);
    public void join(Page<? extends Model> page, String joinOnField, String joinName, String[] attrs);
    public void join(List<? extends Model> models, String joinOnField);
    public void join(List<? extends Model> models, String joinOnField, String[] attrs);
    public void join(List<? extends Model> models, String joinOnField, String joinName);
    public void join(List<? extends Model> models, String joinOnField, String joinName, String[] attrs);
    public void join(Model model, String joinOnField);
    public void join(Model model, String joinOnField, String[] attrs);
    public void join(Model model, String joinOnField, String joinName);
    public void join(Model model, String joinOnField, String joinName, String[] attrs);

    public void keep(Model model, String... attrs);
    public void keep(List<? extends Model> models, String... attrs);
}