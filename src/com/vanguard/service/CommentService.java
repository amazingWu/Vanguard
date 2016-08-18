package com.vanguard.service;

import java.util.List;

import javax.annotation.Resource;

import com.vanguard.dao.CommentDao;
import com.vanguard.entity.Comment;

public class CommentService{
	private CommentDao commentDao;

	@Resource(name="commentDao")
	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}
	
	/**
	 * 评论数量
	 * @param example_id
	 * @return
	 */
	public int GetCommentNum(int example_id){
		return commentDao.GetCommentNum(example_id);
	}
	/**
	 * 总评论数量
	 * @param example_id
	 * @return
	 */
	public int GetCommentNum(){
		return commentDao.GetCommentNum();
	}
	/**
	 * 获取评论
	 * @param example_id
	 * @param start
	 * @param offset
	 * @return
	 */
	public List<Comment> GetComments(long example_id,int start,int offset){
		return commentDao.GetComments(example_id, start, offset);
	}
	
	/**
	 * 获取全部评论
	 * @param example_id
	 * @param start
	 * @param offset
	 * @return
	 */
	public List<Comment> GetComments(int start,int offset){
		return commentDao.GetComments(start, offset);
	}
	/**
	 * 新增评论
	 * @param comment
	 */
	public void AddComment(Comment comment){
		commentDao.AddComment(comment);
	}
	/**
	 * 删除评论
	 * @param id
	 */
	public void DelComment(int id){
		commentDao.DelComment(id);
	}
}
