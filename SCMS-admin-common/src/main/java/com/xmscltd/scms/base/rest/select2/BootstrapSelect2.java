package com.xmscltd.scms.base.rest.select2;

import com.jfinal.plugin.activerecord.Page;

import java.util.List;

/**
 * BootstrapSelect
 * com.xmscltd.scms.base.rest.select2
 * Created with IntelliJ IDEA.
 * Description:
 * Author: alio-cmchen
 * Date: 2018-06-25
 * Time: 22:26
 * Version: V1.0.0
 */
public class BootstrapSelect2<T>  {

    private Integer page;
    private Integer total_count;
    private List<T> items;


    public BootstrapSelect2(Integer page, Integer total, List<T> rows) {
        this.page = page;
        this.total_count = total;
        this.items = rows;
    }

    public BootstrapSelect2(Page<T> page) {
        this.page=page.getPageNumber();
        this.total_count=page.getTotalRow();
        this.items=page.getList();
    }


    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getTotal_count() {
        return total_count;
    }

    public void setTotal_count(Integer total_count) {
        this.total_count = total_count;
    }

    public List<T> getItems() {
        return items;
    }

    public void setItems(List<T> items) {
        this.items = items;
    }
}
