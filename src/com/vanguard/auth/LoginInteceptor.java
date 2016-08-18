package com.vanguard.auth;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;  
import com.opensymphony.xwork2.ActionContext;  
import com.opensymphony.xwork2.ActionInvocation;  
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.vanguard.entity.Author;
import com.vanguard.service.AuthorService;  

public class LoginInteceptor extends AbstractInterceptor {  
	private AuthorService authorService;
	@Resource
    public void setAuthorService(AuthorService authorService) {
		this.authorService = authorService;
	}

	@Override  
    public String intercept(ActionInvocation invocation) throws Exception {  
        // 取得请求相关的ActionContext实例  
        ActionContext ctx = invocation.getInvocationContext();  
        HttpServletRequest request = (HttpServletRequest)ctx.get(ServletActionContext.HTTP_REQUEST);  
        HttpSession session = request.getSession(); 
        try{
        	String userName=(String) session.getAttribute("name");
            String userPwd=(String) session.getAttribute("password");
            if(authorService.GetAuthor(userName, userPwd)!=null){
           	 return invocation.invoke();  
           }
        }catch(Exception e){
        	
        }
        return Action.LOGIN;

    }  
  
}  