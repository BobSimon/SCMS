package com.xmscltd.scms.base.service;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.xmscltd.scms.base.model.User;

import java.util.List;

public interface UserService  {

    /**
     * 分页查询系统用户信息
     * @param pageNumber
     * @param pageSize
     * @param sortName
     * @param sortOrder
     * @return
     */
    public Page<User> findPage(int pageNumber, int pageSize, String sortName,  String sortOrder, String searchText);

    /**
     * 用户名是否存在
     * @param name
     * @return 存在返回-true，否则返回false
     */
    public boolean hasUser(String name);

    /**
     * 根据用户名查询系统用户信息
     * @param name
     * @return
     */
    public User findByUserName(String name);

    /**
     * 保存用户，并且保存用户角色关系
     * @param user 用户
     * @param roles 角色id
     * @return
     */
    public boolean saveUser(User user, Long[] roles);

    /**
     * 修改用户，并且保存用户角色关系
     * @param user 用户
     * @param roles 角色id
     * @return
     */
    public boolean updateUser(User user, Long[] roles);



    /**
     * find model by primary key
     *
     * @param id
     * @return
     */
    public User findById(Object id);


    /**
     * find all model
     *
     * @return all <User
     */
    public List<User> findAll();


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
    public boolean delete(User model);


    /**
     * save model to database
     *
     * @param model
     * @return
     */
    public boolean save(User model);


    /**
     * save or update model
     *
     * @param model
     * @return if save or update success
     */
    public boolean saveOrUpdate(User model);


    /**
     * update data model
     *
     * @param model
     * @return
     */
    public boolean update(User model);


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