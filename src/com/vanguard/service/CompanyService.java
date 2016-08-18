package com.vanguard.service;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.transaction.annotation.Transactional;

import com.vanguard.dao.CompanyDao;
import com.vanguard.entity.Company;

public class CompanyService {
	private CompanyDao companyDao;
	@Resource
	public void setCompanyDao(CompanyDao companyDao) {
		this.companyDao = companyDao;
	}

	/**
	 * 获取列表
	 * @param used
	 * @return
	 */
	public List<Company> GetCompanyAbout(int used){
		return companyDao.GetCompanyAbout(used);
	}
	
	/**
	 * 根据id获取
	 * 
	 * @param id
	 * @return
	 */
	public Company GetCompany(int id){
		return companyDao.GetCompany(id);
	}
	/**
	 * 新增
	 * @param company
	 */
	public void AddCompany(Company company){
		companyDao.AddCompany(company);
	}
	
	/**
	 * 更新
	 * @param company
	 */
	public void UpdateCompany(Company company){
		companyDao.UpdateCompany(company);
	}
	
	/**
	 * 根据id删除公司简介
	 * @param id
	 */
	public void DelCompany(final int id){
		companyDao.DelCompany(id);
	}
	/**
	 * 更新used
	 * @param used
	 * @param id
	 */
	public void ResetCompanyUsed(int used,int id){
		companyDao.ResetCompanyUsed(used, id);
	}
}
