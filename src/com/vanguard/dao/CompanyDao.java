package com.vanguard.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import com.vanguard.entity.Company;

public class CompanyDao extends HibernateDaoSupport{
	
	/**
	 * 查询列表,used=2时代表查找全部
	 * @param used
	 * @return
	 */
	public List<Company> GetCompanyAbout(final int used){
		return this.getHibernateTemplate().execute(new HibernateCallback<List<Company>>() {
			@Override
			public List<Company> doInHibernate(Session session) throws HibernateException {
				// TODO Auto-generated method stub
				String hql="";
				if(used<2){
					hql="From Company where used=:used order by id asc";
					Query query=session.createQuery(hql);
					query.setParameter("used", used);
					return query.list();
				}else{
					hql="From Company order by id asc";
					Query query=session.createQuery(hql);
					return query.list();
				}
			}
		});
	}
	/**
	 * 根据id查找
	 * @param id
	 * @return
	 */
	public Company GetCompany(final long id){
		return this.getHibernateTemplate().get(Company.class, id);
	}
	/**
	 * 新增
	 * @param company
	 */
	@Transactional(readOnly=false)
	public void AddCompany(Company company){
		this.getHibernateTemplate().save(company);
	}
	
	@Transactional(readOnly=false)
	public void UpdateCompany(Company company){
		this.getHibernateTemplate().update(company);
	}
	
	/**
	 * 根据id删除公司简介
	 * @param id
	 */
	public void DelCompany(final int id){
		this.getHibernateTemplate().execute(new HibernateCallback<Integer>() {

			@Override
			public Integer doInHibernate(Session session) throws HibernateException {
				// TODO Auto-generated method stub
				String hql="delete from Company where id in ("+id+")";
				Query query=session.createQuery(hql);
				query.executeUpdate();
				return null;
			}
			
		});
	}
	
	/**
	 * 更新used
	 * @param used
	 * @param id
	 */
	public void ResetCompanyUsed(final int used,final int id){
		this.getHibernateTemplate().execute(new HibernateCallback<Integer>() {

			@Override
			public Integer doInHibernate(Session session) throws HibernateException {
				// TODO Auto-generated method stub
				String hql="update company set used=:used where id=:id";
				Query query=session.createSQLQuery(hql);
				query.setParameter("used", used);
				query.setParameter("id", id);
				query.executeUpdate();
				return null;
			}
			
		});
	}

}
