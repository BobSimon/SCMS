package com.xmscltd.scms.base.service;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.weixin.sdk.api.ApiConfig;
import com.xmscltd.scms.base.model.Weixin;

import java.util.List;

public interface WeixinService  {


    /**
     * find model by appId
     *
     * @param appId
     * @return
     */
    public Weixin findByappId(Object appId);
    /**
     * find model by primary key
     *
     * @param id
     * @return
     */
    public Weixin findById(Object id);


    /**
     * find all model
     *
     * @return all <Weixin
     */
    public List<Weixin> findAll();


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
    public boolean delete(Weixin model);


    /**
     * save model to database
     *
     * @param model
     * @return
     */
    public boolean save(Weixin model);


    /**
     * save or update model
     *
     * @param model
     * @return if save or update success
     */
    public boolean saveOrUpdate(Weixin model);


    /**
     * update data model
     *
     * @param model
     * @return
     */
    public boolean update(Weixin model);


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