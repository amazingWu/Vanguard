<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%String path=request.getContextPath(); %>
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
<link href="videoJs/video-js.css" rel="stylesheet" type="text/css">
<script src="videoJs/video.js"></script>
<script src="js/jquery-1.11.0.min.js"></script>
<!---- start-smoth-scrolling---->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
			jQuery(document).ready(function(；；$) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
			videojs.options.flash.swf = "video-js.swf";
</script>
<!---- start-smoth-scrolling---->
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
					<li><a class="active" href="index.jsp">主页</a><span> </span></li>
					<li><a href="ExampleList.action">案例展示</a><span> </span></li>
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
	
	<!--banner-starts-->
	<s:action name="HeaderList" executeResult="true"/>
	<!--banner-ends--> 
		<!--welcome-starts--> 
	<s:action name="CompanyIndexAbout" executeResult="true"></s:action>
	<!--welcome-ends--> 
	<!--offer-starts-->
	<s:action name="IndexList" executeResult="true"/>
	<!--offer-ends--> 
	<!--nature-starts--> 
	<s:include value="video.jsp"></s:include>
	<!--nature-ends--> 
	<!--field-starts--> 
	<s:action name="WisdomList" executeResult="true"></s:action>
	<!--field-end--> 
	<s:action name="CompanyFootAbout" executeResult="true"></s:action>
</body>
</html>