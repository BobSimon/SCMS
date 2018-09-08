package com.xmscltd.scms.base.service;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.xmscltd.scms.base.model.Quartz;

/**
 * QuartzService
 * com.xmscltd.scms.base.service
 * Created with IntelliJ IDEA.
 * Description:
 * Author: Administrator-cmchen
 * Date: 2018-03-02
 * Time: 15:52
 * Version: V1.0.0
 */
public interface QuartzService {

	/**
     * 分页查询定时任务信息
     * @param pageNumber
     * @param pageSize
     * @param sortName
     * @param sortOrder
     * @return
     */
    public Page<Quartz> findPage(int pageNumber, int pageSize, String sortName,  String sortOrder, String searchText);
    /**
     * 分页查询定时任务
     * @param sysQuartz
     * @return
     */
    public Page<Quartz> findPage(Quartz sysQuartz, int pageNumber, int pageSize);

    /**
     * 根据任务名和任务组名查询任务
     * @param jobName
     * @param jobGroup
     * @return
     */
    public Quartz findByJobNameAndJobGroup(String jobName,String jobGroup);


    /**
     * 根据ID查找model
     *
     * @param id
     * @return
     */
    public Quartz findById(Object id);


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
    public boolean delete(Quartz model);


    /**
     * 保存到数据库
     *
     * @param model
     * @return
     */
    public boolean save(Quartz model);

    /**
     * 保存或更新
     *
     * @param model
     * @return
     */
    public boolean saveOrUpdate(Quartz model);

    /**
     * 更新 model
     *
     * @param model
     * @return
     */
    public boolean update(Quartz model);



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
