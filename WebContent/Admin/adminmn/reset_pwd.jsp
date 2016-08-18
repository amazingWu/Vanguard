<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%String path=request.getContextPath(); %>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>新增案例</title>
	<link rel="stylesheet" href="<%=path %>/Admin/css/reset.css" />
	<link rel="stylesheet" href="<%=path %>/Admin/css/content.css" />
	<script type="text/javascript">
		function repeatcheck(){
			var password_1=document.getElementById("password_1").value;
			var password_2=document.getElementById("password_2").value;
			if(password_1!=password_2){
				alert("两次输入的密码不一致");
				return false;
			}
			return true;
		}
	</script>
</head>
<body marginwidth="0" marginheight="0">
	
	<div class="container">
		<div class="public-nav">您当前的位置：<a href="#">管理首页</a>> 管理员管理</div>
		<div class="public-content">
			<div class="public-content-header">
				<h3>密码修改</h3>
			</div>

			<div class="public-content-cont">
			<form action="<%=path%>/Admin/ResetPwd" onsubmit="return repeatcheck()" id="main_form" method="post">
				<div class="form-group">
					<s:fielderror style="color:red;">
						<s:param>error_message</s:param>
					</s:fielderror>
				</div>

				<div class="form-group">
					<label for="">旧密码:</label>
					<input class="form-input-txt" type="text" name="oldPassword" required="required"/>
				</div>
				<div class="form-group">
					<label for="">新密码:</label>
					<input class="form-input-txt" id="password_1" type="password" name="author.author_password" required="required"/>
				</div>
				<div class="form-group">
					<label for="">新密码确认：</label>
					<input class="form-input-txt" id="password_2" type="password"  required="required"/>
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