package com.vanguard.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Wisdom {
	private long wisdom_id;
	private String wisdom_name;
	private String wisdom_content;
	private String wisdom_photo;
	
	@Id
	@GeneratedValue
	public long getWisdom_id() {
		return wisdom_id;
	}
	public void setWisdom_id(long wisdom_id) {
		this.wisdom_id = wisdom_id;
	}
	public String getWisdom_name() {
		return wisdom_name;
	}
	public void setWisdom_name(String wisdom_name) {
		this.wisdom_name = wisdom_name;
	}
	public String getWisdom_content() {
		return wisdom_content;
	}
	public void setWisdom_content(String wisdom_content) {
		this.wisdom_content = wisdom_content;
	}
	public String getWisdom_photo() {
		return wisdom_photo;
	}
	public void setWisdom_photo(String wisdom_photo) {
		this.wisdom_photo = wisdom_photo;
	}
	

}
