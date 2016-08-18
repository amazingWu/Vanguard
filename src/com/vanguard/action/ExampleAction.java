package com.vanguard.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.sun.net.httpserver.Authenticator.Success;
import com.sun.org.apache.xml.internal.resolver.helpers.Debug;
import com.vanguard.entity.Enums;
import com.vanguard.entity.Example;
import com.vanguard.service.ExampleService;

public class ExampleAction extends ActionSupport{

	private ExampleService exampleService;
	@Resource(name="exampleService")
	public void setExampleService(ExampleService exampleService) {
		this.exampleService = exampleService;
	}
	private int start;
	private int id;
	private int kind;
	private boolean normal;//是否是普通筛选
	private int operate;//操作类型。1为添加，0为删除
	private Example example;
	
	public Example getExample() {
		return example;
	}
	public void setExample(Example example) {
		this.example = example;
	}
	public boolean isNormal() {
		return normal;
	}
	public void setNormal(boolean normal) {
		this.normal = normal;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getOperate() {
		return operate;
	}
	public void setOperate(int operate) {
		this.operate = operate;
	}
	/**
	 * 首页滚动头
	 * @return
	 */
	public String HeaderList(){
		List<Example> list=exampleService.ExampleList(0, 10, Enums.ExampleKind.Header);
		//传送到前台
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute("headlist",list);
		return SUCCESS;
	}
	/**
	 * 首页下案例推荐
	 * @return
	 */
	public String IndexList(){
		List<Example> list=exampleService.ExampleList(0, 4, Enums.ExampleKind.Index);
		//传送到前台
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute("indexlist",list);
		return SUCCESS;
	}
	public String ExampleList(){
		int offset=15;//每页展示的数量
		HttpServletRequest request=ServletActionContext.getRequest();
	    int total_example=exampleService.ExampleNum(Enums.ExampleKind.Normal);
		int total;
		if(total_example%offset==0){
			total=total_example/offset;
		}else{
			total=total_example/offset+1;
		}
		if(start>total){
			start=total;
		}
		if(start<1){
			start=1;
		}
		request.setAttribute("total",total);
		request.setAttribute("current", start);
		request.setAttribute("offset", offset);//每页的数量
		List<Example> list=exampleService.ExampleList((start-1)*offset, offset, Enums.ExampleKind.Normal);
		request.setAttribute("examplelist", list);
		return SUCCESS;
	}
	
	/**
	 * 后台管理列表
	 * 接收 start和kind参数
	 * @return
	 */
	public String AdminList(){
		int offset=15;//每页展示的数量
		HttpServletRequest request=ServletActionContext.getRequest();
	    int total_example;
		if(kind==1){
			total_example=exampleService.ExampleNum(Enums.ExampleKind.Header);
		}else if(kind==2){
			total_example=exampleService.ExampleNum(Enums.ExampleKind.Index);
		}else{
			total_example=exampleService.ExampleNum(Enums.ExampleKind.Normal);
		}
		int total;
		if(total_example%offset==0){
			total=total_example/offset;
		}else{
			total=total_example/offset+1;
		}
		if(start>total){
			start=total;
		}
		if(start<1){
			start=1;
		}
		request.setAttribute("total",total);
		request.setAttribute("current", start);
		request.setAttribute("offset", offset);//每页的数量
		List<Example> list;
		if(kind==1){
			list=exampleService.ExampleList((start-1)*offset, offset, Enums.ExampleKind.Header);
			request.setAttribute("list", list);
			return "header";
		}else if(kind==2){
			list=exampleService.ExampleList((start-1)*offset, offset, Enums.ExampleKind.Index);
			request.setAttribute("list", list);
			return "index";
		}else{
			list=exampleService.ExampleList((start-1)*offset, offset, Enums.ExampleKind.Normal);
			request.setAttribute("list", list);
			return "normal";
		}
	}
	
	/**
	 * 重置推荐参数
	 * 接收id
	 * operate操作类型，1表添加，0表山删除
	 * kind表示在操作哪一种类型
	 * normal是否是在普通列表页操作
	 * start记住操作时所在的页
	 * @return
	 */
	public String ResetRecommend(){
		if(kind==1){
			exampleService.UpdateRecommend(id, operate, Enums.ExampleKind.Header);
		}else{
			exampleService.UpdateRecommend(id, operate, Enums.ExampleKind.Index);
		}
		if(normal){
			this.setKind(3);//若是普通列表操作，则仍返回普通列表页
			return SUCCESS;
		}else{
			return "success_rec";
		}		
	}
	/**
	 * 删除案例。
	 * start记录删除前所在页数；
	 * id记录删除的案例id
	 * @return
	 */
	public String DelExample(){
		exampleService.DelExample(id);
		return SUCCESS;
	}
	
	/**
	 * 新增案例
	 * @return
	 */
	public String AddExample(){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date sendTime=new Date();
		try {
			sendTime=sdf.parse(sdf.format(sendTime.getTime()));
			try {
				sendTime=sdf.parse(sdf.format(new Date()));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			example.setExample_time(sendTime);
			if(example.getExample_name().trim().equals("")||
					example.getExample_about().trim().equals("")||
					example.getExample_author().trim().equals("")||
					example.getExample_content().trim().equals("")||
					example.getExample_photo().trim().equals("")){
				return ERROR;
			}else{
				boolean result=exampleService.AddExample(example);
				if(result){
					return SUCCESS;
				}else{
					return ERROR;
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return ERROR;
		}
	}
	
	/**
	 * 相关案例列表（此处暂时使用首页推荐）
	 * @return
	 */
	public String RelatedExample(){
		List<Example> list=exampleService.ExampleList(0, 10, Enums.ExampleKind.Index);
		//传送到前台
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute("indexlist",list);	
		return SUCCESS;
	}

}
