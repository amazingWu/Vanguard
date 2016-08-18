package com.vanguard.dao;

import java.util.List;


import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import com.vanguard.entity.Author;

public class AuthorDao extends HibernateDaoSupport{
	
	public Author GetAuthor(final String authorName,final String authorPwd){
		return this.getHibernateTemplate().execute(new HibernateCallback<Author>() {
			@Override
			public Author doInHibernate(Session session) throws HibernateException {
				// TODO Auto-generated method stub
				String hql="From Author where author_name=:name and author_password=:pwd";
				Query query=session.createQuery(hql);
				query.setParameter("name", authorName);
				query.setParameter("pwd", authorPwd);
				List<Author> list=query.list();
				if(list.size()>0){
					return (Author)query.list().get(0);
				}else{
					return null;
				}
			}
		});
	}
	@Transactional(readOnly=false)
	public void RestAuthor(Author author){
		this.getHibernateTemplate().update(author);
	}
	
}
