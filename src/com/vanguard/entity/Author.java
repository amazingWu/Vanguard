package com.vanguard.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

//用户类
@Entity
public class Author {

	private String author_name;
	private String author_password;
	@Id
	public String getAuthor_name() {
		return author_name;
	}
	public void setAuthor_name(String author_name) {
		this.author_name = author_name;
	}
	public String getAuthor_password() {
		return author_password;
	}
	public void setAuthor_password(String author_password) {
		this.author_password = author_password;
	}
	
	
}
