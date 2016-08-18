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
						<th>备注信息</th>
						<th>操作</th>
					</tr>
					<s:iterator value="#request.list" id="list">
					<tr>
						<td><s:property value="id"/></td>
						<td><s:property value="comment"/></td>
						<td>
							<div class="table-fun">
								<a target=_blank href="<%=path%>/Admin/PreIndexCompany.action?company_id=<s:property value="id"/>" target=_blank>首页简介预览</a>
								<a target=_blank href="<%=path%>/Admin/PreContentCompany.action?company_id=<s:property value="id"/>" target=_blank>正文简介预览</a>
								<a href="<%=path%>/Admin/EditCompany.action?company_id=<s:property value="id"/>&used=1">修改</a>
								<a href="<%=path%>/Admin/DelCompany.action?company_id=<s:property value="id"/>&used=1">删除</a>
								<s:if test="#list.used==0">
									<a href="<%=path%>/Admin/ResetCompanyUsed.action?company_id=<s:property value="id"/>&used=1">点击使用</a>
								</s:if>
								<s:else>
									<a style="background-color: green;" href="<%=path%>/Admin/ResetCompanyUsed.action?company_id=<s:property value="id"/>&used=0">取消使用</a>
								</s:else>			
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