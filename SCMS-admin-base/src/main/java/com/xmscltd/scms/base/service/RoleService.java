package com.xmscltd.scms.base.service;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.xmscltd.scms.base.model.Role;
import com.xmscltd.scms.base.model.RoleRes;

import java.util.List;

public interface RoleService  {

    /**
     * 分页查询角色信息
     * @param sysRole
     * @return
     */
    public Page<Role> findPage(Role sysRole, int pageNumber, int pageSize);

    /**
     * 根据用户名查询用户所具有的角色列表信息
     * @param name
     * @return
     */
    public List<Role> findByUserName(String name);

    /**
     * 角色赋权
     * @param id 角色id
     * @param resIds 角色资源树 ids
     */
    public boolean auth(Long id, String resIds);

    /**
     * 查询可用角色列表
     * @return
     */
    public List<Role> findByStatusUsed();

    /**
     * 根据ID查找model
     *
     * @param id
     * @return
     */
    public Role findById(Object id);


    /**
     * 根据ID删除model
     *
     * @param id
     * @return
     */
    public boolean deleteById(Object id);

    /**
     * 删除
     *
     * @param model
     * @return
     */
    public boolean delete(Role model);


    /**
     * 保存到数据库
     *
     * @param model
     * @return
     */
    public boolean save(Role model);

    /**
     * 保存或更新
     *
     * @param model
     * @return
     */
    public boolean saveOrUpdate(Role model);

    /**
     * 更新 model
     *
     * @param model
     * @return
     */
    public boolean update(Role model);



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