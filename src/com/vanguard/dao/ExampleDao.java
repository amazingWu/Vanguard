package com.vanguard.dao;

import java.util.List;

import javax.persistence.EnumType;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import com.vanguard.entity.Enums;
import com.vanguard.entity.Example;

public class ExampleDao extends HibernateDaoSupport{


	/**
	 * 查询装修案例
	 * @param start
	 * @param offset
	 * @return
	 */
	public List<Example> ExampleList(final int start,final int offset,Enums.ExampleKind kind){
		List<Example> list=this.getHibernateTemplate().execute(new HibernateCallback<List<Example>>() {
			@Override
			public List<Example> doInHibernate(Session session) throws HibernateException {
				// TODO Auto-generated method stub
				String hql="";
				Query query;
				if(kind==Enums.ExampleKind.Header){
					hql="From Example where example_header=:value order by example_time desc";
					query=session.createQuery(hql);
					query.setParameter("value", 1);
				}else if(kind==Enums.ExampleKind.Index){
					hql="From Example where example_index=:value order by example_time desc";
					query=session.createQuery(hql);
					query.setParameter("value", 1);
				}else{
					hql="From Example order by example_time desc";
					query=session.createQuery(hql);
				}
				query.setFirstResult(start);
				query.setMaxResults(offset);
				return query.list();
			}
		});
		return list;
	}
	/**
	 * 增加案例
	 * @param example
	 */
	@Transactional(readOnly=false)
	public void AddExample(Example example){
		this.getHibernateTemplate().save(example);
	}
	/**
	 * 查询总数量
	 * @return
	 */
	public int ExampleNum(Enums.ExampleKind kind){
		return this.getHibernateTemplate().execute(new HibernateCallback<Integer>() {

			@Override
			public Integer doInHibernate(Session session) throws HibernateException {
				// TODO Auto-generated method stub
				String hql="select count(*) from example";
				if(kind==Enums.ExampleKind.Header){
					hql=hql+" where example_header=1";
				}else if(kind==Enums.ExampleKind.Index){
					hql=hql+" where example_index=1";
				}
				Query query=session.createSQLQuery(hql);
				return ((Number)query.uniqueResult()).intValue();
			}
		});
	}
	
	/**
	 * 重置案例的首页滚动和首页推荐
	 */
	public void UpdateRecommend(final int id,final int value,final Enums.ExampleKind kind){
		this.getHibernateTemplate().execute(new HibernateCallback<Boolean>() {
			@Override
			public Boolean doInHibernate(Session session) throws HibernateException {
				// TODO Auto-generated method stub
				try{
					String sql;
					if(kind==Enums.ExampleKind.Header){
						sql="update example set example_header=:value where example_id=:id";
					}else{
						sql="update example set example_index=:value where example_id=:id";
					}
					Query query=session.createSQLQuery(sql);
					query.setParameter("value", value);
					query.setParameter("id", id);
					query.executeUpdate();
					return true;
				}catch(Exception e){
					e.printStackTrace();
					return false;
				}
			}
		});
	}
	/**
	 * 删除案例
	 */
	public void DelExample(final long id){
		this.getHibernateTemplate().execute(new HibernateCallback<Boolean>() {

			@Override
			public Boolean doInHibernate(Session session) throws HibernateException {
				// TODO Auto-generated method stub
				try{
					String hql="delete from Example where example_id in ("+id+")";
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
	
	/**
	 * 根据id查找
	 */
	public Example GetExample(long id){
		return this.getHibernateTemplate().get(Example.class, id);
	}
	/**
	 * 更新
	 * @param example
	 */
	@Transactional(readOnly=false)
	public void Update(Example example){
		this.getHibernateTemplate().update(example);
	}
	
}
