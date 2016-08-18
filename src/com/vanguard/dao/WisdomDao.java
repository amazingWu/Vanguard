package com.vanguard.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import com.vanguard.entity.Wisdom;

public class WisdomDao extends HibernateDaoSupport{
	
	/**
	 * 获取列表
	 * @return
	 */
	public List<Wisdom> WisdomList(){
		return (List<Wisdom>) this.getHibernateTemplate().find("from Wisdom", null);
	}
	
	/**
	 * 增加或更新列表
	 * @param wisdom
	 */
	@Transactional(readOnly=false)
	public void AddUpdateWisdom(Wisdom wisdom){
		this.getHibernateTemplate().saveOrUpdate(wisdom);
	}
	
	/**
	 * 根据id查找Wisdom
	 * 
	 * @param id
	 * @return
	 */
	public Wisdom GetWisdom(final long id){
		return this.getHibernateTemplate().get(Wisdom.class, id);
	}
	
	
	/**
	 * 删除
	 * @param id
	 */
	public void DelWisdom(final int id){
		this.getHibernateTemplate().execute(new HibernateCallback<Boolean>() {

			@Override
			public Boolean doInHibernate(Session session) throws HibernateException {
				// TODO Auto-generated method stub
				try{
					String hql="delete from Wisdom where wisdom_id in ("+id+")";
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
