package com.vanguard.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.ForeignKey;

@Entity
public class Comment {

	private long comment_id;
	private String comment_name;
	private String comment_email;
	private String comment_phone;
	private String comment_content;
	private long example_id;
	
	@Id
	@GeneratedValue
	public long getComment_id() {
		return comment_id;
	}
	
	public void setComment_id(long comment_id) {
		this.comment_id = comment_id;
	}
	public String getComment_name() {
		return comment_name;
	}
	public void setComment_name(String comment_name) {
		this.comment_name = comment_name;
	}
	
	public String getComment_email() {
		return comment_email;
	}
	public void setComment_email(String comment_email) {
		this.comment_email = comment_email;
	}
	public String getComment_phone() {
		return comment_phone;
	}
	public void setComment_phone(String comment_phone) {
		this.comment_phone = comment_phone;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public long getExample_id() {
		return example_id;
	}
	public void setExample_id(long example_id) {
		this.example_id = example_id;
	}
}
