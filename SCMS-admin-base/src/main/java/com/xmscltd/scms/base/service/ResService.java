package com.xmscltd.scms.base.service;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.xmscltd.scms.base.common.ZTree;
import com.xmscltd.scms.base.model.Res;

import java.util.List;

public interface ResService  {


    /**
     * 通过用户名查询菜单
     * @param name
     * @return
     */
    public List<Res> findMenuByUserName(String name);
    /**
     * 系统资源查询分页数据
     * @param sysRes 查询条件
     * @return 分页数据
     */
    public Page<Res> findPage(Res sysRes, int pageNumber, int pageSize);

    /**
     * 查询可用Res树
     * @return
     */
    public List<ZTree> findTreeOnUse();

    /**
     * 查询全部资源树
     * @return
     */
    public List<ZTree> findAllTree();

    /**
     * 根据角色ID查询资源树，角色赋权使用
     * @param id
     * @return
     */
    public List<ZTree> findTreeOnUseByRoleId(Long id);

    /**
     * 根据角色ID查询可用资源列表
     * @param id
     * @return
     */
    public List<Res> findByRoleIdAndStatusUsed(Long id);

    /**
     * 根据状态查询资源列表
     * @return
     */
    public List<Res> findByStatus(String status);

    /**
     * 根据用户名查询用户所拥有的资源集
     * @param name
     * @return
     */
    public List<Res> findByUserNameAndStatusUsed(String name);

    /**
     * 查询顶部菜单树资源
     * @param name
     * @return
     */
    public List<Res> findTopMenuByUserName(String name);

    /**
     * 查询左侧菜单树资源
     * @param name 用户名
     * @param pid 顶部菜单id
     * @return
     */
    public List<Res> findLeftMenuByUserNameAndPid(String name, Long pid);
    
    /**
     * （通过用户--菜单表）查询菜单
     * @param id 用户id
     * @return
     */
    public List<Res> findMenuByUserId(Long id);

    /**
     * 资源节点是否有子节点
     * @param id 节点id
     * @return
     */
    public boolean hasChildRes(Long id);

    /**
     * 根据ID查找model
     *
     * @param id
     * @return
     */
    public Res findById(Object id);


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
    public boolean delete(Res model);


    /**
     * 保存到数据库
     *
     * @param model
     * @return
     */
    public boolean save(Res model);

    /**
     * 保存或更新
     *
     * @param model
     * @return
     */
    public boolean saveOrUpdate(Res model);

    /**
     * 更新 model
     *
     * @param model
     * @return
     */
    public boolean update(Res model);


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