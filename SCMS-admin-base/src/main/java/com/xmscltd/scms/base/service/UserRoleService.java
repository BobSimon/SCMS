package com.xmscltd.scms.base.service;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.xmscltd.scms.base.model.UserRole;

import java.util.List;

public interface UserRoleService  {

    /**
     * 根据userId删除model
     * @param userId
     */
    public int deleteByUserId(Long userId);

    /**
     * 批量保存 model
     * @param list
     * @return
     */
    public int[] batchSave(List<UserRole> list);
    /**
     * find model by primary key
     *
     * @param id
     * @return
     */
    public UserRole findById(Object id);


    /**
     * find all model
     *
     * @return all <UserRole
     */
    public List<UserRole> findAll();


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
    public boolean delete(UserRole model);


    /**
     * save model to database
     *
     * @param model
     * @return
     */
    public boolean save(UserRole model);


    /**
     * save or update model
     *
     * @param model
     * @return if save or update success
     */
    public boolean saveOrUpdate(UserRole model);


    /**
     * update data model
     *
     * @param model
     * @return
     */
    public boolean update(UserRole model);


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