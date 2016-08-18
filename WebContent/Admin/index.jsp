<%@ page language="java" pageEncoding="utf-8"%>
<%String path=request.getContextPath();
String userName=(String)request.getSession().getAttribute("name");%>
<!DOCTYPE html>
<html>
<head>
	<title>威嘉装修后台</title>
	<link rel="shortcut icon" type="image/x-icon" href="<%=path %>/images/logo.jpg" media="screen" />
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title></title>
	<link rel="stylesheet" href="<%=path %>/Admin/css/reset.css">
	<link rel="stylesheet" href="<%=path %>/Admin/css/public.css">
</head>
<body>
<div class="public-header-warrp">
	<div class="public-header">
		<div class="content">
			<div class="public-header-logo"><a href="<%=path%>/index.jsp"><img src="<%=path%>/images/logo.jpg"/ width="70px;"><h3>威嘉后台管理</h3></a></div>
			<div class="public-header-admin fr">
				<p class="admin-name">尊敬的 <%=userName %> 您好！</p>
				<div class="public-header-fun fr">
					<a href="welcome.jsp" target="content" class="public-header-man">首页</a>
					<a href="<%=path %>/Admin/Logout.action" class="public-header-loginout">安全退出</a>	
				</div>
			</div>
		</div>
	</div>
</div>
<div class="clearfix"></div>
<!-- 内容展示 -->
<div class="public-ifame mt20">
	<div class="content">
		<!-- 左侧导航栏 -->
		<div class="public-ifame-leftnav">
			<div class="public-title-warrp">
				<div class="public-ifame-title ">
					<a href="welcome.jsp" target="content">首页</a>
				</div>
			</div>
			<ul class="left-nav-list">
				<li class="public-ifame-item">
					<a href="javascript:;">管理员管理</a>
					<div class="ifame-item-sub">
						<ul>
							<li><a href="ResetPwd.action" target="content">密码修改</a></li>
						</ul>
					</div>
				</li>
				<li class="public-ifame-item">
					<a href="javascript:;">案例管理</a>
					<div class="ifame-item-sub">
						<ul>
							<li><a href="ExampleList.action?start=1&kind=3" target="content">列表管理</a>|<a href="examplemn/example_add.jsp" target="content">添加</a></li>
							<li><a href="ExampleList.action?start=1&kind=1" target="content">首页滚动管理</a></li>
							<li><a href="ExampleList.action?start=1&kind=2" target="content">首页展示管理</a></li>
						</ul>
					</div>
				</li>
				<li class="public-ifame-item">
					<a href="javascript:;">公司简介管理</a>
					<div class="ifame-item-sub">
						<ul>
							<li><a href="CompanyList.action" target="content">列表查看</a></li>
							<li><a href="companymn/company_add.jsp" target="content">新增</a></li>
						</ul>
					</div>
				</li>
				<li class="public-ifame-item">
					<a href="javascript:;">评论管理</a>
					<div class="ifame-item-sub">
						<ul>
							<li><a href="AdminCommentList.action" target="content">列表查看</a></li>
						</ul>
					</div>
				</li>
				<li class="public-ifame-item">
					<a href="javascript:;">配图管理</a>
					<div class="ifame-item-sub">
						<ul>
							<li><a href="photomn/background.jsp" target="content">首页背景管理</a></li>
							<li><a href="photomn/logo.jsp" target="content">公司LOGO管理</a></li>
							<li><a href="photomn/vedio.jsp" target="content">宣传视频管理</a></li>
						</ul>
					</div>
				</li>
				<li class="public-ifame-item">
					<a href="javascript:;">名言管理</a>
					<div class="ifame-item-sub">
						<ul>
							<li><a href="WisdomList.action" target="content">名言列表</a></li>
							<li><a href="EditWisdom.action" target="content">新增名言</a></li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
		<!-- 右侧内容展示部分 -->
		<div class="public-ifame-content">
		<iframe name="content" src="welcome.jsp" frameborder="0" id="mainframe" scrolling="yes" marginheight="0" marginwidth="0" width="100%" style="height: 700px;"></iframe>
		</div>
	</div>
</div>
<script src="js/jquery.min.js"></script>
<script>
$().ready(function(){
	var item = $(".public-ifame-item");

	for(var i=0; i < item.length; i++){
		$(item[i]).on('click',function(){
			$(".ifame-item-sub").hide();
			if($(this.lastElementChild).css('display') == 'block'){
				$(this.lastElementChild).hide()
				$(".ifame-item-sub li").removeClass("active");
			}else{
				$(this.lastElementChild).show();
				$(".ifame-item-sub li").on('click',function(){
					$(".ifame-item-sub li").removeClass("active");
					$(this).addClass("active");
				});
			}
		});
	}
});
</script>
</body>
</html>