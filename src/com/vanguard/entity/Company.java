package com.vanguard.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Company {

	private long id;
	private String index_about;//首页简介
	private String content_about;//正文简介
	private int used;
	private String comment;//备注信息
	private String foot_about;//脚注介绍
	@Id
	@GeneratedValue
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getIndex_about() {
		return index_about;
	}
	public void setIndex_about(String index_about) {
		this.index_about = index_about;
	}
	public String getContent_about() {
		return content_about;
	}
	public void setContent_about(String content_about) {
		this.content_about = content_about;
	}
	public int getUsed() {
		return used;
	}
	public void setUsed(int used) {
		this.used = used;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getFoot_about() {
		return foot_about;
	}
	public void setFoot_about(String foot_about) {
		this.foot_about = foot_about;
	}
	
}
