<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s"  uri="/struts-tags"%>
<%String path=request.getContextPath(); 
	long id=(Long)request.getAttribute("id");	
%>
<!DOCTYPE html>
<html>
<head>
<title>威嘉装修</title>
<link rel="shortcut icon" type="image/x-icon" href="<%=path %>/images/logo.jpg" media="screen" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Majestic Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="<%=path %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="<%=path %>/css/style.css" rel='stylesheet' type='text/css' />
<link href='http://fonts.useso.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900' rel='stylesheet' type='text/css'>
<script src="<%=path %>/js/jquery-1.11.0.min.js"></script>
<!---- start-smoth-scrolling---->
<script type="text/javascript" src="<%=path %>/js/move-top.js"></script>
<script type="text/javascript" src="<%=path %>/js/easing.js"></script>
<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
		</script>
<!---- start-smoth-scrolling---->
</head>
<body>
	<!----start-header---->
	<div class="header" id="home">
		<div class="container">
			<div class="logo">
				<a href="<%=path %>/index.jsp"><img src="<%=path %>/images/logo.jpg" alt=""></a>
			</div>
			<div class="navigation">
			 <span class="menu"></span> 
				<ul class="navig">
					<li><a href="<%=path %>/index.jsp">主页</a><span> </span></li>
					<li><a class="active" href="ExampleList.action">案例展示</a><span> </span></li>
					<li><a href="CompanyContentAbout.action">公司简介</a><span> </span></li>
				</ul>
			</div>
				 <!-- script-for-menu -->
		 <script>
				$("span.menu").click(function(){
					$(" ul.navig").slideToggle("slow" , function(){
					});
				});
		 </script>
		 <!-- script-for-menu -->
		</div>
	</div>
	<!----end-header---->
	<!--blog-->
	<s:action name="Content" executeResult="true"></s:action>
	<!--blog-->
	<s:action name="CompanyFootAbout" executeResult="true"></s:action>
</body>
</html>