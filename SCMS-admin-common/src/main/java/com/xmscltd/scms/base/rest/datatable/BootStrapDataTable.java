package com.xmscltd.scms.base.rest.datatable;

import java.util.List;

import com.jfinal.plugin.activerecord.Page;

/**
 * bootStrap 数据表格
 * @author x
 *
 */
public class BootStrapDataTable<T> {

	private Integer page;  
    private Integer total;  
    private List<T> rows;  
  
  
    public BootStrapDataTable() {  
    }  
  
    public BootStrapDataTable(Integer page, Integer total, List<T> rows) {  
        this.page = page;  
        this.total = total;  
        this.rows = rows;  
    }  
    
    public BootStrapDataTable(Page<T> page) {
    	this.page=page.getPageNumber();
    	this.total=page.getTotalRow();
    	this.rows=page.getList();
    }
  
    public Integer getPage() {  
        return page;  
    }  
  
    public void setPage(Integer page) {  
        this.page = page;  
    }  
  
    public Integer getTotal() {  
        return total;  
    }  
  
    public void setTotal(Integer total) {  
        this.total = total;  
    }  
  
    public List<T> getRows() {  
        return rows;  
    }  
  
    public void setRows(List<T> rows) {  
        this.rows = rows;  
    }  
}
