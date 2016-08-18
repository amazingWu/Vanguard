<%@ page language="java" pageEncoding="utf-8"%>
<%String path=request.getContextPath(); %>
<%
	int offset=(Integer)request.getAttribute("offset");
	int current=(Integer)request.getAttribute("current");
	int total=(Integer)request.getAttribute("total");
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>后台欢迎页</title>
	<link rel="stylesheet" href="<%=path%>/Admin/css/reset.css" />
	<link rel="stylesheet" href="<%=path%>/Admin/css/content.css" />
</head>
<body marginwidth="0" marginheight="0">
	<div class="container">
		<div class="public-nav">您当前的位置：<a href="">管理首页</a><a href="">评论管理</a></div>
		<div class="public-content">
			<div class="public-content-header">
				<h3>评论列表</h3>
			</div>
			<div class="public-content-cont">
				<table class="public-cont-table">
					<tr>
						<th>所属案例</th>
						<th>编号</th>
						<th>评论者</th>
						<th>评论信息</th>
						<th>邮箱</th>
						<th>联系方式</th>
						<th>操作</th>
					</tr>
					<s:iterator value="#request.list" id="list">
					<tr>
						<td><a href="<%=path%>/Detail.action?id=<s:property value="example_id"/>" target=_blank><s:property value="example_id"/></a></td>
						<td><s:property value="comment_id"/></td>
						<td><s:property value="comment_name"/></td>
						<td style="max-width:260px;"><s:property value="comment_content"/></td>
						<td><s:property value="comment_email"/></td>
						<td><s:property value="comment_phone"/></td>
						<td>
							<div class="table-fun">
								<a href="<%=path%>/Admin/AdminCommentDel.action?comment_id=<s:property value="comment_id"/>&example_id=<s:property value="example_id"/>">删除</a>
							</div>
						</td>
					</tr>
					</s:iterator>
				</table>
				<div class="page">
					<form action="<%=path%>/Admin/ExampleList.action?kind=3" method="get">
						<a href="<%=path%>/Admin/ExampleList.action?start=1&kind=3">首页</a>
						<%if(current>1){%>
							<a href="<%=path%>/Admin/ExampleList.action?start=<%=current-1%>&kind=3">上一页</a>
						<%}%>
						<%if(current<total){%>
							<a href="<%=path%>/Admin/ExampleList.action?start=<%=current+1%>&kind=3">下一页</a>
						<%}%>
						第<span style="color:red;font-weight:600"><%=current %></span>页
						共<span style="color:red;font-weight:600"><%=total %></span>页
						<input type="text" class="page-input" name="start">
						<input type="submit" class="page-btn" value="跳转">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>