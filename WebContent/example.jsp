<%@ page language="java" pageEncoding="utf-8"%>
<%String path=request.getContextPath(); %>
<%
	int offset=(Integer)request.getAttribute("offset");
	int current=(Integer)request.getAttribute("current");
	int total=(Integer)request.getAttribute("total");
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>威嘉装修</title>
<link rel="shortcut icon" type="image/x-icon" href="<%=path %>/images/logo.jpg" media="screen" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Majestic Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href='http://fonts.useso.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900' rel='stylesheet' type='text/css'>
<script src="js/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/style4.css" />
<script type="text/javascript" src="js/modernizr.custom.79639.js"></script>
<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
			videojs.options.flash.swf = "video-js.swf";
</script>
<style type="text/css">
	.jump-button{
	    font-size: 13px;
	    margin-top: 2px;
	    color: #fff;
	    background: #97262a;
	    padding: 0.1em 0.5em;
	    font-size: 1em;
	    margin-top: 1em;
	    border: none;
	    outline: none;
	    border-radius: 0.3em;
	    -webkit-border-radius: 0.3em;
	    -moz-border-radius: 0.3em;
	    -o-border-radius: 0.3em;
	}
</style>
</head>
<body>
	<!----start-header---->
	<div class="header" id="home">
		<div class="container">
			<div class="logo">
				<a href="index.jsp"><img src="images/logo.jpg" alt=""></a>
			</div>
			<div class="navigation">
			 <span class="menu"></span> 
				<ul class="navig">
					<li><a href="index.jsp">主页</a><span> </span></li>
					<li><a class="active" href="ExampleList.action">案例展示</a><span> </span></li>
					<li><a href="CompanyContentAbout.action">公司简介</a><span> </span></li>
				</ul>
			</div>
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
	<!--about-starts--> 
	<div class="about">
		<div class="container">
			<div class="about-top heading">
				<div class="about-bottom">
					<s:iterator value="#request.examplelist" id="list">
					<div class="col-md-4 about-left">
						<a href="<%=path%>/Detail.action?id=<s:property value="example_id"/>"><img src="<s:property value="example_photo"/>" alt="<s:property value="example_photo"/>" /></a>
						<h5><a href="<%=path%>/Detail.action?id=<s:property value="example_id"/>"><s:property value="example_name"/></a></h5>
						<p>设计师：<s:property value="example_author"/></p>
					</div>
					</s:iterator>
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="page" style="width:300px;margin:0 auto;margin-top: 30px;">
					<form action="<%=path%>/ExampleList.action" method="get">
						
						<a class="jump-button" href="<%=path%>/ExampleList.action">首页</a>
						<%if(current>1){%>
							<a href="<%=path%>/ExampleList.action?start=<%=current-1%>">上一页</a>
						<%}%>
						<%if(current<total){%>
							<a href="<%=path%>/ExampleList.action?start=<%=current+1%>">下一页</a>
						<%}%>
						第<span style="color:#97262a;font-weight:600"><%=current %></span>页
						共<span style="color:#97262a;font-weight:600"><%=total %></span>页
						<input type="text" class="page-input" name="start" style="width: 30px;">
						<input type="submit" class="jump-button" value="跳转">
					</form>
			</div>
		</div>
	</div>
	<!--footer-starts--> 
	<s:action name="CompanyFootAbout" executeResult="true"></s:action>
	<!--footer-ends--> 
</body>
</html>