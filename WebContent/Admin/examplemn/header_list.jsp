<%@ page language="java" pageEncoding="utf-8"%>
<%String path=request.getContextPath(); %>
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
		<div class="public-nav">您当前的位置：<a href="">管理首页</a><a href="">案例管理</a></div>
		<div class="public-content">
			<div class="public-content-header">
				<h3>案例列表</h3>
			</div>
			<div class="public-content-cont">
				<table class="public-cont-table">
					<tr>
						<th>编号</th>
						<th>案例名称</th>
						<th>设计师</th>
						<th>推送时间</th>
						<th>操作</th>
					</tr>
					<s:iterator value="#request.list" id="list">
					<tr>
						<td><s:property value="example_id"/></td>
						<td><s:property value="example_name"/></td>
						<td><s:property value="example_author"/></td>
						<td><s:property value="example_time"/></td>
						<td>
							<div class="table-fun">
								<a href="<%=path %>/Admin/ResetRecommend.action?id=<s:property value="example_id"/>&operate=0&kind=1">删除滚动</a>
							</div>
						</td>
					</tr>
					</s:iterator>

				</table>
				<div class="page">
					<form action="<%=path%>/Admin/ExampleList" method="get">
						<%
							int offset=(Integer)request.getAttribute("offset");
							int current=(Integer)request.getAttribute("current");
							int total=(Integer)request.getAttribute("total");
						%>
						<a href="<%=path%>/Admin/ExampleList.action?start=1">首页</a>
						<%if(current>1){%>
							<a href="<%=path%>/Admin/ExampleList.action?start=<%=current-1%>">上一页</a>
						<%}%>
						<%if(current<total){%>
							<a href="<%=path%>/Admin/ExampleList.action?start=<%=current+1%>">下一页</a>
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