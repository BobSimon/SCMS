package com.xmscltd.scms.base.common;

import java.util.List;

/**
 * ComboTreeModel
 * com.xmscltd.scms.base.common
 * Created with IntelliJ IDEA.
 * Description:
 * Author: alio-cmchen
 * Date: 2018-06-25
 * Time: 10:20
 * Version: V1.0.0
 */
public class ComboTreeModel {

    private int id;
    private String text;
    private int level;
    private String isleaf;
    private List<ComboTreeModel> children;
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getText() {
        return text;
    }
    public void setText(String text) {
        this.text = text;
    }
    public List<ComboTreeModel> getChildren() {
        return children;
    }
    public void setChildren(List<ComboTreeModel> children) {
        this.children = children;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getIsleaf() {
        return isleaf;
    }

    public void setIsleaf(String isleaf) {
        this.isleaf = isleaf;
    }
}
