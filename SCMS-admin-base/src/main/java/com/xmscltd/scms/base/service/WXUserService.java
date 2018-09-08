package com.xmscltd.scms.base.service;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.xmscltd.scms.base.model.WXUser;

import java.util.List;

public interface WXUserService  {


    /**
     * find model userId
     *
     * @param userId
     * @return
     */
    public WXUser findByUserId(Object userId);
    /**
     * find model by openId
     *
     * @param openId
     * @return
     */
    public WXUser findByUnionid(Object unionid);

    /**
     * find model by primary key
     *
     * @param id
     * @return
     */
    public WXUser findById(Object id);


    /**
     * find all model
     *
     * @return all <WXUser
     */
    public List<WXUser> findAll();


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
    public boolean delete(WXUser model);


    /**
     * save model to database
     *
     * @param model
     * @return
     */
    public boolean save(WXUser model);


    /**
     * save or update model
     *
     * @param model
     * @return if save or update success
     */
    public boolean saveOrUpdate(WXUser model);


    /**
     * update data model
     *
     * @param model
     * @return
     */
    public boolean update(WXUser model);


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
    
    /**
     * 获取openid
     */
    public String getOpenidByUserId(Object userId);
}