package com.vanguard.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import com.vanguard.entity.Comment;
import com.vanguard.entity.Enums;

public class CommentDao extends HibernateDaoSupport {
	/**
	 * 获取评论
	 * @param example_id
	 * @param start
	 * @param offset
	 * @return
	 */
	public List<Comment> GetComments(final long example_id,final int start,final int offset){
		return this.getHibernateTemplate().execute(new HibernateCallback<List<Comment>>() {

			@Override
			public List<Comment> doInHibernate(Session session) throws HibernateException {
				// TODO Auto-generated method stub
				String hql="From Comment where example_id=:example_id order by comment_id DESC";
				Query query=session.createQuery(hql);
				query.setParameter("example_id", example_id);
				query.setFirstResult(start);
				query.setMaxResults(offset);
				return query.list();
			}
			
		});
	}
	
	/**
	 * 获取全部评论
	 * @param example_id
	 * @param start
	 * @param offset
	 * @return
	 */
	public List<Comment> GetComments(final int start,final int offset){
		return this.getHibernateTemplate().execute(new HibernateCallback<List<Comment>>() {

			@Override
			public List<Comment> doInHibernate(Session session) throws HibernateException {
				// TODO Auto-generated method stub
				String hql="From Comment order by comment_id DESC";
				Query query=session.createQuery(hql);
				query.setFirstResult(start);
				query.setMaxResults(offset);
				return query.list();
			}
		});
	}
	/**
	 * 评论数量
	 * @param example_id
	 * @return
	 */
	public int GetCommentNum(final int example_id){
		return this.getHibernateTemplate().execute(new HibernateCallback<Integer>() {
			@Override
			public Integer doInHibernate(Session session) throws HibernateException {
				// TODO Auto-generated method stub
				String hql="select count(*) from comment where example_id=:example_id";
				Query query=session.createSQLQuery(hql);
				query.setParameter("example_id", example_id);
				return ((Number)query.uniqueResult()).intValue();
			}
		});
	}
	/**
	 * 总评论数量
	 * @param example_id
	 * @return
	 */
	public int GetCommentNum(){
		return this.getHibernateTemplate().execute(new HibernateCallback<Integer>() {
			@Override
			public Integer doInHibernate(Session session) throws HibernateException {
				// TODO Auto-generated method stub
				String hql="select count(*) from comment";
				Query query=session.createSQLQuery(hql);
				return ((Number)query.uniqueResult()).intValue();
			}
		});
	}
	
	/**
	 * 新增评论
	 * @param comment
	 */
	@Transactional(readOnly=false)
	public void AddComment(Comment comment){
		this.getHibernateTemplate().save(comment);
	}
	
	/**
	 * 删除评论
	 * @param id
	 */
	public void DelComment(final int id){
		this.getHibernateTemplate().execute(new HibernateCallback<Boolean>() {

			@Override
			public Boolean doInHibernate(Session session) throws HibernateException {
				// TODO Auto-generated method stub
				try{
					String hql="delete from Comment where comment_id in ("+id+")";
					Query query=session.createQuery(hql);
					query.executeUpdate();
					return true;
				}catch(Exception e){
					e.printStackTrace();
					return false;
				}
			}
		});
	}

}
