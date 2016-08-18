<%@ page language="java" pageEncoding="utf-8"%>
<%String path=request.getContextPath();%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title></title>
	<link rel="stylesheet" href="<%=path %>/Admin/css/reset.css" />
	<link rel="stylesheet" href="<%=path %>/Admin/css/login.css" />
</head>
<body>
<div class="page">
	<div class="loginwarrp">
		<div class="logo">管理员登陆</div>
        <div class="login_form">
			<form id="Login" name="Login" method="post" onsubmit="" action="login">
				<s:fielderror>
				   <s:param>error_message</s:param>
				</s:fielderror>
				<li class="login-item">
					<span>用户名：</span>
					<input type="text" name="author.author_name" class="login_input" required="required">
				</li>
				<li class="login-item">
					<span>密　码：</span>
					<input type="password" name="author.author_password" class="login_input" required="required">
				</li>
				<div class="clearfix"></div>
				<li class="login-sub">
					<input type="submit" name="Submit" value="登录" />
				</li>
           </form>
		</div>
	</div>
</div>
</body>
</html>