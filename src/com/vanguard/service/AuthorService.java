package com.vanguard.service;

import javax.annotation.Resource;

import com.vanguard.dao.AuthorDao;
import com.vanguard.entity.Author;
import com.vanguard.entity.Example;

public class AuthorService {

	
	private AuthorDao authorDao;
	
	@Resource(name="authorDao")
	public void setAuthorDao(AuthorDao authorDao) {
		this.authorDao = authorDao;
	}
	
	/**
	 * 根据用户名和密码获取用户资料
	 * @param authorName
	 * @param authorPwd
	 * @return
	 */
	public Author GetAuthor(String authorName,String authorPwd){
		return authorDao.GetAuthor(authorName, authorPwd);
	}
	/**
	 * 更新用户信息
	 * @param author
	 */
	public void RestAuthor(Author author){
		authorDao.RestAuthor(author);
	}
	
}
