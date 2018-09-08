package com.xmscltd.scms.base.service;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.xmscltd.scms.base.model.Log;

public interface LogService  {

    /**
     * 系统资源查询分页数据
     * @param pageNumber
     * @param pageSize
     * @param sortName
     * @param sortOrder
     * @param searchText
     * @return
     */
    public Page<Log> findPage(int pageNumber, int pageSize, String sortName,  String sortOrder, String searchText);
    
    /**
     * find model by primary key
     *
     * @param id
     * @return
     */
    public Log findById(Object id);


    /**
     * find all model
     *
     * @return all <Log
     */
    public List<Log> findAll();


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
    public boolean delete(Log model);


    /**
     * save model to database
     *
     * @param model
     * @return
     */
    public boolean save(Log model);


    /**
     * save or update model
     *
     * @param model
     * @return if save or update success
     */
    public boolean saveOrUpdate(Log model);


    /**
     * update data model
     *
     * @param model
     * @return
     */
    public boolean update(Log model);


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