<%@ page language="java" pageEncoding="utf-8"%>
<%String path=request.getContextPath();%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title></title>
	<link rel="stylesheet" href="<%=path %>/Admin/css/reset.css" />
	<link rel="stylesheet" href="<%=path %>/Admin/css/login.css" />
	<script type="text/javascript">
		function back(){
			window.location.href="<%=path %>/Admin/welcome.jsp";
		}
	</script>
</head>
<body>
<div class="page">
	<div class="loginwarrp" style="margin: 100px auto;">
		<div class="logo">操作出现问题，请见谅</div>
        <div class="login_form">
				<div class="clearfix"></div>
				<li class="login-sub">
					<input type="button" onclick="back()" value="回到首页" />
				</li>
		</div>
	</div>
</div>
</body>
</html>