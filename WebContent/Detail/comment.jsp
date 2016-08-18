<%@page import="com.vanguard.entity.Comment"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s"  uri="/struts-tags"%>
<%String path=request.getContextPath(); %>
<%
	int offset=(Integer)request.getAttribute("num");
	int current=(Integer)request.getAttribute("current");
	int total=(Integer)request.getAttribute("total");
	int example_id=(Integer)request.getAttribute("example_id");
	int comment_lenght=((List<Comment>)request.getAttribute("list")).size();
%>
<script type="text/javascript">
			
</script>

					<div class="comments">
						<div class="comments-top heading">
							<h3>精彩评论</h3>
						</div>
						<div class="comments-bottom">
							<s:iterator value="#request.list">
								<div class="media">
										<div class="media-left">
											<a>
											<img class="media-object" src="images/co.png" alt="">
											</a>
										</div>
										<div class="media-body">
											<h4 class="media-heading"><p><s:property value="comment_name"/></p></h4>
											<p><s:property value="comment_content"/></p>
										</div>
								</div>
							</s:iterator>
							<%if(comment_lenght==0){%>
								<p>暂无评论，赶紧第一个留言吧</p>
							<%} %>
								
						</div>
						<div class="page" style="width:300px;margin:0 auto;margin-top: 30px;">
									<input type="button" class="jump-button" onclick="ajaxRequest(<%=example_id %>,1)" value="首页"/>
									<%if(current>1){%>
										<a href="ajaxRequest(<%=example_id %>,<%= current-1%>)">上一页</a>
									<%}%>
									<%if(current<total){%>
										<a href="ajaxRequest(<%=example_id %>,<%= current+1%>)">下一页</a>
									<%}%>
									第<span style="color:#97262a;font-weight:600"><%=current %></span>页
									共<span style="color:#97262a;font-weight:600"><%=total %></span>页
									<input type="text" id="index_num" class="page-input" style="width: 30px;">
									<input type="button" class="jump-button" value="跳转" onclick="jump(<%=example_id %>)">
						</div>
					</div>
