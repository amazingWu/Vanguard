package com.vanguard.action;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.vanguard.entity.Enums;

public class FileUploadAction extends ActionSupport{
	private File background;

	private File logo;
	private File video;
	private File videoPhoto;
	
	
	
	
	public File getVedioPhoto() {
		return videoPhoto;
	}

	public void setVedioPhoto(File vedioPhoto) {
		this.videoPhoto = vedioPhoto;
	}

	public File getVedio() {
		return video;
	}

	public void setVedio(File vedio) {
		this.video = vedio;
	}

	public File getLogo() {
		return logo;
	}

	public void setLogo(File logo) {
		this.logo = logo;
	}

	public File getBackground() {
		return background;
	}

	public void setBackground(File background) {
		this.background = background;
	}
	
	public String BackgroundUpload(){
		//设置上传文件目录    
        String realpath = ServletActionContext.getServletContext().getRealPath("/images");  
        //判断上传文件是否为空      
        if(background!=null)  
        {  
                //设置目标文件（根据 parent 路径名字符串和 child 路径名字符串创建一个新 File 实例）  
                File savefile = new File(realpath,Enums.backgroundName);  
                // 判断上传目录是否存在            
                if(!savefile.getParentFile().exists())  
                      savefile.getParentFile().mkdirs();  
                //把文件uploadfile 拷贝到 savefile 里,FileUtils类需要commons-io-x.x.x.jar包支持  
                try {
					FileUtils.copyFile(background,savefile);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return ERROR;
				}  
        }  
		return SUCCESS;
	}
	
	public String LogoUpload(){
		//设置上传文件目录    
        String realpath = ServletActionContext.getServletContext().getRealPath("/images");  
        //判断上传文件是否为空      
        if(logo!=null)  
        {  
                //设置目标文件（根据 parent 路径名字符串和 child 路径名字符串创建一个新 File 实例）  
                File savefile = new File(realpath,Enums.logoName);  
                // 判断上传目录是否存在            
                if(!savefile.getParentFile().exists())  
                      savefile.getParentFile().mkdirs();  
                //把文件uploadfile 拷贝到 savefile 里,FileUtils类需要commons-io-x.x.x.jar包支持  
                try {
					FileUtils.copyFile(logo,savefile);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return ERROR;
				}  
        }  
		return SUCCESS;
	}
	
	/**
	 * 上传宣传视频
	 * @return
	 */
	public String VideoUpload(){
		//设置上传文件目录    
        String realpath = ServletActionContext.getServletContext().getRealPath("/images");  
        //判断上传文件是否为空      
        if(video!=null&&videoPhoto!=null)  
        {  
                //设置目标文件（根据 parent 路径名字符串和 child 路径名字符串创建一个新 File 实例）  
                File savefile = new File(realpath,Enums.videoName);
                File photo = new File(realpath,Enums.videoPoster);
                // 判断上传目录是否存在            
                if(!savefile.getParentFile().exists())  
                	savefile.getParentFile().mkdirs();  
                if(!photo.getParentFile().exists())  
                	photo.getParentFile().mkdirs(); 
                //把文件uploadfile 拷贝到 savefile 里,FileUtils类需要commons-io-x.x.x.jar包支持 
                try {
					FileUtils.copyFile(video,savefile);
					FileUtils.copyFile(videoPhoto, photo);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return ERROR;
				}
        }  
		return SUCCESS;
	}
}
