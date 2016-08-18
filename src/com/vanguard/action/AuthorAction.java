package com.vanguard.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.sun.net.httpserver.Authenticator.Success;
import com.vanguard.entity.Author;
import com.vanguard.service.AuthorService;

public class AuthorAction extends ActionSupport{

	private Author author;
	private AuthorService authorService;
	private String oldPassword;
	
	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	@Resource(name="authorService")
	public void setAuthorService(AuthorService authorService) {
		this.authorService = authorService;
	}

	public Author getAuthor() {
		return author;
	}

	public void setAuthor(Author author) {
		this.author = author;
	}
	/**
	 * 登录
	 * @return
	 */
	public String Login(){
		String method = ServletActionContext.getRequest().getMethod();
		if("GET".equals(method)){
			return NONE;
		}else{
			if(author==null||author.getAuthor_name()==null||author.getAuthor_password()==null){
				addFieldError("error_message","用户名或密码不能为空");
				return NONE;
			}
			Author authorTemp=authorService.GetAuthor(author.getAuthor_name(), author.getAuthor_password());
			if(authorTemp==null){
				addFieldError("error_message","用户名或密码错误");
				return NONE;//登录失败
			}
			else{
				HttpServletRequest request=ServletActionContext.getRequest();
				request.getSession().setAttribute("name", authorTemp.getAuthor_name());
				request.getSession().setAttribute("password", authorTemp.getAuthor_password());
				return SUCCESS;//登录成功
			}
		}
	}
	public String Logout(){
		HttpServletRequest request=ServletActionContext.getRequest();
		request.getSession().setAttribute("name", null);
		request.getSession().setAttribute("password", null);
		request.getSession().setMaxInactiveInterval(0);
		return SUCCESS;
	}

	public String ResetPwd(){
		String method = ServletActionContext.getRequest().getMethod();
		if("GET".equals(method)){
			return "page";//进入重置密码界面
		}else{
			HttpServletRequest request=ServletActionContext.getRequest();
			try{
				String userName=(String)request.getSession().getAttribute("name");
				String userPwd=(String)request.getSession().getAttribute("password");//session中的密码
				if(userPwd.equals(oldPassword)){//判断用户给的旧密码是不是正确的密码
					author.setAuthor_name(userName);//从前台没有传用户名，因此要补全
					authorService.RestAuthor(author);
				}else{
					addFieldError("error_message", "您提供的原密码不正确");
					return ERROR;
				}
			}catch(Exception e){
				return ERROR;
			}
			request.getSession().setAttribute("password",author.getAuthor_password());
			return SUCCESS;
		}
		
	}
	

}
