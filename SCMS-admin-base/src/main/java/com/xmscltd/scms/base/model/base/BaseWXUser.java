package com.xmscltd.scms.base.model.base;

import io.jboot.db.model.JbootModel;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by Jboot, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseWXUser<M extends BaseWXUser<M>> extends JbootModel<M> implements IBean {

    public static final String ACTION_ADD = "Wxuser:add";
    public static final String ACTION_DELETE = "Wxuser:delete";
    public static final String ACTION_UPDATE = "Wxuser:update";



	public void setId(java.lang.Long id) {
		set("id", id);
	}
	
	public java.lang.Long getId() {
		return getLong("id");
	}

	public void setNickname(java.lang.String nickname) {
		set("nickname", nickname);
	}
	
	public java.lang.String getNickname() {
		return getStr("nickname");
	}

	public void setUserid(java.lang.Long userid) {
		set("userid", userid);
	}
	
	public java.lang.Long getUserid() {
		return getLong("userid");
	}

	public void setWxid(java.lang.Integer wxid) {
		set("wxid", wxid);
	}
	
	public java.lang.Integer getWxid() {
		return getInt("wxid");
	}

	public void setOpenid(java.lang.String openid) {
		set("openid", openid);
	}
	
	public java.lang.String getOpenid() {
		return getStr("openid");
	}

	public void setCountry(java.lang.String country) {
		set("country", country);
	}
	
	public java.lang.String getCountry() {
		return getStr("country");
	}

	public void setProvince(java.lang.String province) {
		set("province", province);
	}
	
	public java.lang.String getProvince() {
		return getStr("province");
	}

	public void setCity(java.lang.String city) {
		set("city", city);
	}
	
	public java.lang.String getCity() {
		return getStr("city");
	}

	public void setHeadingUrl(java.lang.String headingUrl) {
		set("heading_url", headingUrl);
	}
	
	public java.lang.String getHeadingUrl() {
		return getStr("heading_url");
	}

	public void setStatus(java.lang.String status) {
		set("status", status);
	}
	
	public java.lang.String getStatus() {
		return getStr("status");
	}

	public void setQyuserid(java.lang.String qyuserid) {
		set("qyuserid", qyuserid);
	}
	
	public java.lang.String getQyuserid() {
		return getStr("qyuserid");
	}

	public void setUnionid(java.lang.String unionid) {
		set("unionid", unionid);
	}
	
	public java.lang.String getUnionid() {
		return getStr("unionid");
	}

}
