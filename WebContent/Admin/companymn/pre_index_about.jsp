
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%String path=request.getContextPath(); %>
<html>
<head>
<title>威嘉装修</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Majestic Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="<%=path%>/css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="<%=path%>/css/style.css" rel='stylesheet' type='text/css' />
<link href='<%=path%>/http://fonts.useso.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900' rel='stylesheet' type='text/css'>
<link href="<%=path%>/videoJs/video-js.css" rel="stylesheet" type="text/css">
<script src="<%=path%>/videoJs/video.js"></script>
<script src="<%=path%>/js/jquery-1.11.0.min.js"></script>
<!---- start-smoth-scrolling---->
<script type="text/javascript" src="<%=path%>/js/move-top.js"></script>
<script type="text/javascript" src="<%=path%>/js/easing.js"></script>
<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
			videojs.options.flash.swf = "video-js.swf";
</script>
</script>
<!---- start-smoth-scrolling---->
</head>
<body>
<!----start-header---->
	<div class="header" id="home">
		<div class="container">
			<div class="logo">
				<a href=""><img src="<%=path%>/images/logo-2.png" alt=""></a>
			</div>
			<div class="navigation">
			 <span class="menu"></span> 
				<ul class="navig">
					<li><a href="">主页</a><span> </span></li>
					<li><a href="">案例展示</a><span> </span></li>
					<li><a href="">公司简介</a><span> </span></li>
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
	<!--welcome-starts--> 
	<div class="welcome">
		<div class="container">
			<%=request.getAttribute("index_about") %>
		</div>
	</div>
	<!--welcome-ends--> 
	<!--field-starts--> 
	<div class="fields">
		<div class="container">
			<div class="fields-top">
				<div class="col-md-4 fields-left">
					<span class="home"></span>
					<h4>Vestibulum vel finibus</h4>
					<p>Pellentesque sed sem bibendum, rutrum ipsum vitae, facilisis turpis. Mauris vitae metus gravida, hendrerit erat ac, facilisis ligula.</p>
				</div>
				<div class="col-md-4 fields-left">
					<span class="men"></span>
					<h4>Quisque non ligula</h4>
					<p>Pellentesque sed sem bibendum, rutrum ipsum vitae, facilisis turpis. Mauris vitae metus gravida, hendrerit erat ac, facilisis ligula.</p>
				</div>
				<div class="col-md-4 fields-left">
					<span class="pen"></span>
					<h4>Lorem ipsum dolor</h4>
					<p>Pellentesque sed sem bibendum, rutrum ipsum vitae, facilisis turpis. Mauris vitae metus gravida, hendrerit erat ac, facilisis ligula.</p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--field-end--> 
	<s:include value="/footer.html"></s:include>
</body>
</html>