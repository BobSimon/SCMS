package com.xmscltd.scms.base.common;

import java.util.List;

/**
 * 菜单实体
 *
 * @author Rlax
 *
 */
public class DepartItem {

    /** 菜单标题 */
    private String name;
    /** 菜单图标 */
    private String icon;

    /** id */
    private Long id;

    private List<DepartItem> subset;

    public DepartItem(String name, String icon, Long id) {
        this.name = name;
        this.icon = icon;
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public List<DepartItem> getSubset() {
        return subset;
    }

    public void setSubset(List<DepartItem> subset) {
        this.subset = subset;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
