<%@ page language="java" pageEncoding="utf-8"%>
<%String path=request.getContextPath(); %>
<%@taglib prefix="s" uri="/struts-tags"%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>新增简介</title>
	<link rel="stylesheet" href="<%=path %>/Admin/css/reset.css" />
	<link rel="stylesheet" href="<%=path %>/Admin/css/content.css" />
	<script charset="utf-8" src="<%=path %>/Admin/kingediter/kindeditor-all.js"></script>
	<script charset="utf-8" src="<%=path %>/Admin/kingediter/lang/zh-CN.js"></script>
	<script charset="utf-8" src="<%=path %>/Admin/js/jquery.min.js"></script>
	
	<script type="text/javascript">  
		function getImgURL() {    
		    var fileName = document.getElementById("img").value;
		    alert(fileName);
		}  
		         
	</script>  
</head>
<body marginwidth="0" marginheight="0">
	<div class="container">
		<div class="public-nav">您当前的位置：<a href="">管理首页</a>>名言管理</div>
		<div class="public-content">
			<div class="public-content-header">
				<h3>新增或编辑</h3>
			</div>
			<div class="public-content-cont">
			<form action="<%=path%>/Admin/SaUpWisdom"  enctype="multipart/form-data" method="post">
				<s:fielderror>
				   <s:param>error_message</s:param>
				</s:fielderror>
				<input class="form-input-txt" style="display: none;" type="text" name="wisdom.wisdom_id" value="${wisdom.wisdom_id}" />
				<div class="form-group">
					<label for="">原头像</label>
					<img id="img" alt="" width="50px" height="50px" src="${wisdom.wisdom_photo }" onchange="getImgURL()">
					<br/>
					<label for="">上传新头像</label>
					<input type="file" name="file" required="required"/>
				</div>
				<div class="form-group">
					<label for="">名称</label>
					<input class="form-input-txt" type="text" name="wisdom.wisdom_name" value="${wisdom.wisdom_name}" required="required"/>
				</div>
				<div class="form-group">
					<label for="">内容</label>
					<textarea class="form-input-textara" type="text" name="wisdom.wisdom_content" required="required">${wisdom.wisdom_content}</textarea> 
				</div>	
				<div class="form-group" style="margin-left:150px;">
					<input type="submit" class="sub-btn" value="提  交" />
					<input type="reset" class="sub-btn" value="重  置" />
				</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>