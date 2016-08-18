package com.vanguard.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.vanguard.entity.Comment;
import com.vanguard.service.CommentService;

public class CommentAction extends ActionSupport{

	private Comment comment;//新增评论提交参数
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}

	private int comment_id;
	private int example_id;//案例id
	private int current_index;//当前页数
	
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public int getCurrent_index() {
		return current_index;
	}
	public void setCurrent_index(int current_index) {
		this.current_index = current_index;
	}

	private CommentService commentService;
	public int getExample_id() {
		return example_id;
	}
	public void setExample_id(int example_id) {
		this.example_id = example_id;
	}
	@Resource
	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}
	
	public String GetComment(){
		int num=15;//每页显示的数量
		HttpServletRequest request=ServletActionContext.getRequest();
		int total_index=commentService.GetCommentNum(example_id);//评论总数
		int total;//总页数
		if(total_index%num==0){
			total=total_index/num;
		}else{
			total=total_index/num+1;
		}
		if(current_index>total){
			current_index=total;
		}
		if(current_index<1){
			current_index=1;
		}
		request.setAttribute("current", current_index);
		request.setAttribute("total",total);
		request.setAttribute("num",num);
		request.setAttribute("example_id",example_id);
		request.setAttribute("list", commentService.GetComments(example_id, (current_index-1)*num, num));
		return SUCCESS;
	}
	/**
	 * 增加评论
	 * @return
	 */
	public String AddComment(){
		try{
			commentService.AddComment(comment);
			example_id=(int) comment.getExample_id();
			return SUCCESS;
		}catch(Exception e){
			example_id=(int) comment.getExample_id();
			return SUCCESS;
		}
	}

	public String AdminCommentDelPersonal(){
		commentService.DelComment(comment_id);
		return SUCCESS;
	}
	public String AdminCommentDel(){
		commentService.DelComment(comment_id);
		return SUCCESS;
	}
	
	public String AdminCommentList(){
		int num=40;//每页显示的数量
		HttpServletRequest request=ServletActionContext.getRequest();
		int total_index=commentService.GetCommentNum();//评论总数
		int total;//总页数
		if(total_index%num==0){
			total=total_index/num;
		}else{
			total=total_index/num+1;
		}
		if(current_index>total){
			current_index=total;
		}
		if(current_index<1){
			current_index=1;
		}
		request.setAttribute("current", current_index);
		request.setAttribute("total",total);
		request.setAttribute("num",num);
		request.setAttribute("example_id",example_id);
		request.setAttribute("list", commentService.GetComments((current_index-1)*num, num));
		return SUCCESS;
	}
	/**
	 * 管理员界面对案例的个别化管理
	 * @return
	 */
	public String AdminCommentPersonal(){
		int num=40;//每页显示的数量
		HttpServletRequest request=ServletActionContext.getRequest();
		int total_index=commentService.GetCommentNum(example_id);//评论总数
		int total;//总页数
		if(total_index%num==0){
			total=total_index/num;
		}else{
			total=total_index/num+1;
		}
		if(current_index>total){
			current_index=total;
		}
		if(current_index<1){
			current_index=1;
		}
		request.setAttribute("current", current_index);
		request.setAttribute("total",total);
		request.setAttribute("num",num);
		request.setAttribute("example_id",example_id);
		request.setAttribute("list", commentService.GetComments(example_id, (current_index-1)*num, num));
		return SUCCESS;
	}
	
}
