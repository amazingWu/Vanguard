package com.vanguard.action;

import java.text.SimpleDateFormat;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.omg.CORBA.Request;

import com.opensymphony.xwork2.ActionSupport;
import com.vanguard.entity.Example;
import com.vanguard.service.ExampleService;

public class DetailAction extends ActionSupport{

	private long id;
	private ExampleService exampleService;
	private Example example;
	private String time;//显示给前台的案例创建时间
	

	public Example getExample() {
		return example;
	}

	public void setExample(Example example) {
		this.example = example;
	}

	@Resource(name="exampleService")
	public void setExampleService(ExampleService exampleService) {
		this.exampleService = exampleService;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	
	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	/**
	 * 内容详细页导航
	 * @return
	 */
	public String Detail(){
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute("id", id);
		return SUCCESS;
	}
	/**
	 * 详细页
	 * @return
	 */
	public String Content(){
		example=exampleService.GetExample(id);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String time = sdf.format(example.getExample_time());
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute("time", time);
		return SUCCESS;
	}
	/**
	 * 打开编辑界面
	 * @return
	 */
	public String Editor(){
		example=exampleService.GetExample(id);
		return SUCCESS;
	}
	/**
	 * 更新
	 * @return
	 */
	public String Update(){
/*		try{*/
			exampleService.Update(example);
			return SUCCESS;
/*		}catch(Exception e){
			return ERROR;
		}*/
	}
	
	
}
