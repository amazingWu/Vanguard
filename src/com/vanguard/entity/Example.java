package com.vanguard.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.ForeignKey;

import com.sun.istack.internal.NotNull;


@Entity
public class Example {

	private long example_id;//标识符
	@NotNull
	private String example_name;//正文标题
	@NotNull
	private String example_about;//简介
	@NotNull
	private String example_content;//正文内容
	@NotNull
	private Date example_time;//时间
	@NotNull
	private String example_author;//提交作者
	private int example_header;//是否在首页的滚动条显示，1代表是
	private int example_index;//是否在首页下展示，1代表是
	@NotNull
	private String example_photo;//照片预览

	public String getExample_photo() {
		return example_photo;
	}
	public void setExample_photo(String example_photo) {
		this.example_photo = example_photo;
	}
	public int getExample_header() {
		return example_header;
	}
	public void setExample_header(int example_header) {
		this.example_header = example_header;
	}
	public int getExample_index() {
		return example_index;
	}
	public void setExample_index(int example_index) {
		this.example_index = example_index;
	}
	@Id
	@GeneratedValue
	public long getExample_id() {
		return example_id;
	}
	public void setExample_id(long example_id) {
		this.example_id = example_id;
	}
	public String getExample_name() {
		return example_name;
	}
	public void setExample_name(String example_name) {
		this.example_name = example_name;
	}
	public String getExample_about() {
		return example_about;
	}
	public void setExample_about(String example_about) {
		this.example_about = example_about;
	}
	public String getExample_content() {
		return example_content;
	}
	public void setExample_content(String example_content) {
		this.example_content = example_content;
	}
	public Date getExample_time() {
		return example_time;
	}
	public void setExample_time(Date example_time) {
		this.example_time = example_time;
	}
	public String getExample_author() {
		return example_author;
	}
	public void setExample_author(String example_author) {
		this.example_author = example_author;
	}
	
}
