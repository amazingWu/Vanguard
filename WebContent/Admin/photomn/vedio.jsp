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
	<link rel="stylesheet" href="<%=path%>/Admin/css/newcss.css" />
</head>
<body marginwidth="0" marginheight="0">
	<div class="container">
		<div class="public-nav">您当前的位置：<a href="">管理首页</a><a href="">配图管理</a></div>
		<div class="public-content">
			<div class="public-content-header">
				<h3>宣传视频管理</h3>
			</div>
			<div style="margin-top: 50px;margin-bottom: 30px;">选择你要上传的视频，然后点击提交(mp4)</div><br/>
			<form action="VideoUp.action" method="post" enctype="multipart/form-data">
				<div>封   面:<input type="file" class="submit-button" name="vedioPhoto"></div>			
				<div>视频源:<input type="file" class="submit-button" name="vedio"></div>
    			<br/>
    			<input type="submit" class="submit-button" value="提交">
		    </form>
		</div>
	</div>
</body>
</html>