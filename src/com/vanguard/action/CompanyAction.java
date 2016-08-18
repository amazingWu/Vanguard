package com.vanguard.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.vanguard.entity.Company;
import com.vanguard.service.CompanyService;

public class CompanyAction extends ActionSupport{
	private Company company;
	private CompanyService companyService;
	
	private int company_id;
	private int used;

	public int getCompany_id() {
		return company_id;
	}

	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}

	public int getUsed() {
		return used;
	}

	public void setUsed(int used) {
		this.used = used;
	}

	@Resource
	public void setCompanyService(CompanyService companyService) {
		this.companyService = companyService;
	}
	
	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	/**
	 * 新增公司简介
	 * @return
	 */
	public String AddCompany(){
		try{
			companyService.AddCompany(company);
			return SUCCESS;
		}catch(Exception e){
			return ERROR;
		}
	}
	/**
	 * 获取公司简介全部列表
	 * @return
	 */
	public String CompanyList(){
		List<Company> list=companyService.GetCompanyAbout(2);
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute("list", list);
		return SUCCESS;
	}
	/**
	 * 获取使用状态中的首页公司简介
	 * @return
	 */
	public String CompanyIndexAbout(){
		List<Company> list=companyService.GetCompanyAbout(1);
		HttpServletRequest request=ServletActionContext.getRequest();
		if(list.size()>0){
			request.setAttribute("index_about",list.get(0).getIndex_about());
		}else{
			request.setAttribute("index_about","");
		}
		return SUCCESS;
	}
	/**
	 * 获取使用状态中的正文公司简介
	 * @return
	 */
	public String CompanyContentAbout(){
		List<Company> list=companyService.GetCompanyAbout(1);
		HttpServletRequest request=ServletActionContext.getRequest();
		if(list.size()>0){
			request.setAttribute("content_about",list.get(0).getContent_about());
		}else{
			request.setAttribute("content_about","");
		}
		return SUCCESS;
	}
	/**
	 * 使用状态中的页脚公司简介
	 * @return
	 */
	public String CompanyFootAbout(){
		List<Company> list=companyService.GetCompanyAbout(1);
		HttpServletRequest request=ServletActionContext.getRequest();
		if(list.size()>0){
			request.setAttribute("foot_about",list.get(0).getFoot_about());
		}else{
			request.setAttribute("foot_about","");
		}
		return SUCCESS;
	}
	/**
	 * 更新ued属性
	 * @return
	 */
	public String ResetCompanyUsed(){
		companyService.ResetCompanyUsed(used, company_id);
		return SUCCESS;
	}
	
	/**
	 * 删除公司简介
	 * @return
	 */
	public String DelCompany(){
		companyService.DelCompany(company_id);
		return SUCCESS;
	}
	
	/**
	 * 进入编辑公司简介
	 * @return
	 */
	public String EditCompany(){
		//try{
			company=companyService.GetCompany(company_id);
			return SUCCESS;
		//}catch(Exception e){
		//	return ERROR;
		//}
	}
	/**
	 * 更新公司简介
	 * @return
	 */
	public String UpdateCompany(){
		try{
			companyService.UpdateCompany(company);
			return SUCCESS;
		}catch(Exception e){
			return ERROR;
		}
	}
	
	/**
	 * 预览公司首页简介
	 * @return
	 */
	public String PreIndexAbout(){
		HttpServletRequest request=ServletActionContext.getRequest();
		Company company=companyService.GetCompany(company_id);
		request.setAttribute("index_about", company.getIndex_about());
		return SUCCESS;
	}
	
	/**
	 * 预览公司正文简介
	 * @return
	 */
	public String PreContentAbout(){
		HttpServletRequest request=ServletActionContext.getRequest();
		Company company=companyService.GetCompany(company_id);
		request.setAttribute("content_about", company.getContent_about());
		return SUCCESS;
	}
	

}
