<%@ page language="java" pageEncoding="utf-8"%>
<%String path=request.getContextPath(); %>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>新增案例</title>
	<link rel="stylesheet" href="<%=path %>/Admin/css/reset.css" />
	<link rel="stylesheet" href="<%=path %>/Admin/css/content.css" />
	<script charset="utf-8" src="<%=path %>/Admin/kingediter/kindeditor-all.js"></script>
	<script charset="utf-8" src="<%=path %>/Admin/kingediter/lang/zh-CN.js"></script>
	<script charset="utf-8" src="<%=path %>/Admin/js/jquery.min.js"></script>
</head>
<body marginwidth="0" marginheight="0">
	<div class="container">
		<div class="public-nav">您当前的位置：<a href="">管理首页</a>>新增案例</div>
		<div class="public-content">
			<div class="public-content-header">
				<h3>增加案例</h3>
			</div>
			<div class="public-content-cont">
			<form action="<%=path%>/Admin/AddExample" method="post">
				
				<div class="form-group">
					<label for="">案例名称</label>
					<input class="form-input-txt" type="text" name="example.example_name" value="${example.example_name}" />
				</div>
				<div class="form-group">
					<label for="">设计师</label>
					<input class="form-input-txt" type="text" name="example.example_author" value="${example.example_author}" />
				</div>
				<div class="form-group">
					<label for="">案例缩略图</label>
					<input class="form-input-txt" type="text" id="photo"  placeholder="请粘贴图片地址" name="example.example_photo" value="${example.example_photo }" />
					
				</div>
				<div class="form-group">
					<label for="">案例简介</label>
					<textarea class="form-input-textara" type="text" name="example.example_about" >${example.example_about }</textarea> 
				</div>
				<div class="form-group">
					<label for="">案例正文</label>
					<textarea id="editor_id" name="example.example_content"  class="form-input-textara" style="width:700px;height:300px;">
						${example.example_content}
					</textarea>
				</div>
				<div class="form-group" style="margin-left:150px;">
					<input type="submit" class="sub-btn" value="提  交" />
					<input type="reset" class="sub-btn" value="重  置" />
				</div>
				</form>
			</div>
		</div>
	</div>
	<script src="<%=path %>/Admin/kingediter/kindeditor-all-min.js"></script>
<script>
	 KindEditor.ready(function(K) {
                window.editor = K.create('#editor_id',{
                	uploadJson : '<%=request.getContextPath()%>/Admin/kingediter/jsp/upload_json.jsp',
                	fileManagerJson : '<%=request.getContextPath()%>/Admin/kingediter/jsp/file_manager_json.jsp',
                	allowFileManager : true
                });
        });
</script>
</body>
</html>