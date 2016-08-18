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
		<div class="public-nav">您当前的位置：<a href="">管理首页</a><a href="">名言管理</a></div>
		<div class="public-content">
			<div class="public-content-header">
				<h3>名言列表</h3>
			</div>
			<div class="public-content-cont">
				<table class="public-cont-table">
					<tr>
						<th>编号</th>
						<th>头像</th>
						<th>名称</th>
						<th>内容</th>
						<th>操作</th>
					</tr>
					<s:iterator value="#request.list" id="list">
					<tr>
						<td><s:property value="wisdom_id"/></td>
						<td><img width="50px" height="50px" src="<s:property value="wisdom_photo"/>"/></td>
						<td><s:property value="wisdom_name"/></td>
						<td><s:property value="wisdom_content"/></td>
						<td>
							<div class="table-fun">
								<a href="<%=path%>/Admin/EditWisdom.action?wisdom_id=<s:property value="wisdom_id"/>">修改</a>
								<a href="<%=path%>/Admin/DelWisdom.action?wisdom_id=<s:property value="wisdom_id"/>">删除</a>	
							</div>
						</td>
					</tr>
					</s:iterator>

				</table>
			</div>
		</div>
	</div>
</body>
</html>