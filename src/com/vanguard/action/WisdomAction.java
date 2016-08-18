package com.vanguard.action;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.vanguard.entity.Enums;
import com.vanguard.entity.Wisdom;
import com.vanguard.service.WisdomService;

public class WisdomAction extends ActionSupport{

	private WisdomService wisdomService;
	private int wisdom_id;
	private Wisdom wisdom;
	private File file;
	/* <!--获取上传文件名,命名格式：表单file控件名+FileName(固定)-->    */  
     private String fileFileName;  

     //获取上传文件类型,命名格式：表单file控件名+ContentType(固定)   
     private String fileContentType;      
	
	

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public int getWisdom_id() {
		return wisdom_id;
	}

	public void setWisdom_id(int wisdom_id) {
		this.wisdom_id = wisdom_id;
	}

	public Wisdom getWisdom() {
		return wisdom;
	}

	public void setWisdom(Wisdom wisdom) {
		this.wisdom = wisdom;
	}

	@Resource
	public void setWisdomService(WisdomService wisdomService) {
		this.wisdomService = wisdomService;
	}
	
	/**
	 * 获取wisdom列表
	 * @return
	 */
	public String WisdomList(){
		List<Wisdom>list=wisdomService.WisdomList();
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute("list", list);
		return SUCCESS;
	}
	/**
	 * 进入编辑界面
	 * @return
	 */
	public String EditWisdom(){
		try{
			wisdom=wisdomService.GetWisdom(wisdom_id);
			return SUCCESS;
		}catch(Exception e)
		{
			return ERROR;
		}
	}
	/**
	 * 新增或更新
	 * @return
	 */
	public String SaUpWisdom(){
		System.out.println(fileContentType);
		if(fileContentType==null||!fileContentType.contains("image")){
			addFieldError("error_message", "文件类型不正确，请重新选择文件");
			return ERROR;
		}
		//设置上传文件目录    
        String realpath = ServletActionContext.getServletContext().getRealPath("/images/wisdom");  
        //判断上传文件是否为空      
        if(file!=null)  
        {  
                //设置目标文件（根据 parent 路径名字符串和 child 路径名字符串创建一个新 File 实例）  
                File savefile = new File(realpath,fileFileName);
                // 判断上传目录是否存在            
                if(!savefile.getParentFile().exists())  
                	savefile.getParentFile().mkdirs();  
                //把文件uploadfile 拷贝到 savefile 里,FileUtils类需要commons-io-x.x.x.jar包支持 
                try {
					FileUtils.copyFile(file,savefile);
					wisdom.setWisdom_photo("/Vanguard/images/wisdom/"+fileFileName);
	        		wisdomService.AddUpdateWisdom(wisdom);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					addFieldError("error_message", "文件上传出现了点错误");
					return ERROR;
				}
        		return SUCCESS;
        }else{
        	addFieldError("error_message", "文件不能为空");
        	return ERROR;
        }
        

	}
	
}
