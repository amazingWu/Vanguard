<%@ page language="java" pageEncoding="utf-8"%>
<%String path=request.getContextPath(); %>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>新增简介</title>
	<link rel="stylesheet" href="<%=path %>/Admin/css/reset.css" />
	<link rel="stylesheet" href="<%=path %>/Admin/css/content.css" />
	<script charset="utf-8" src="<%=path %>/Admin/kingediter/kindeditor-all.js"></script>
	<script charset="utf-8" src="<%=path %>/Admin/kingediter/lang/zh-CN.js"></script>
	<script charset="utf-8" src="<%=path %>/Admin/js/jquery.min.js"></script>
</head>
<body marginwidth="0" marginheight="0">
	<div class="container">
		<div class="public-nav">您当前的位置：<a href="">管理首页</a>>公司简介管理</div>
		<div class="public-content">
			<div class="public-content-header">
				<h3>编辑简介</h3>
			</div>
			<div class="public-content-cont">
			<form action="<%=path%>/Admin/UpdateCompany" method="post">
				<input class="form-input-txt" style="display: none;" type="text" name="company.id" value="${company.id}" />
				<input class="form-input-txt" style="display: none;" type="text" name="company.used" value="${company.used}" />
				<div class="form-group">
					<label for="">备注信息</label>
					<input class="form-input-txt" type="text" name="company.comment" value="${company.comment}" />
				</div>
				<div class="form-group">
					<label for="">首页简介编辑</label>
					<textarea id="editor_id" name="company.index_about"  class="form-input-textara" style="width:1000px;height:300px;" required="required">
						${company.index_about}
					</textarea>
				</div>
				<div class="form-group">
					<span><label for="">正文简介编辑</label></span>
					<textarea id="editor_id2" name="company.content_about"  class="form-input-textara" style="width:1000px;height:300px;" required="required">
						${company.content_about}
					</textarea>
				</div>
				<div class="form-group">
					<span><label for="">页脚简介编辑</label></span>
					<textarea id="editor_id3" name="company.foot_about"  class="form-input-textara" style="width:1000px;height:300px;" required="required">
						${company.foot_about}
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
                window.editor = K.create('#editor_id2',{
                	uploadJson : '<%=request.getContextPath()%>/Admin/kingediter/jsp/upload_json.jsp',
                	fileManagerJson : '<%=request.getContextPath()%>/Admin/kingediter/jsp/file_manager_json.jsp',
                	allowFileManager : true
                });
                window.editor = K.create('#editor_id3',{
                	uploadJson : '<%=request.getContextPath()%>/Admin/kingediter/jsp/upload_json.jsp',
                	fileManagerJson : '<%=request.getContextPath()%>/Admin/kingediter/jsp/file_manager_json.jsp',
                	allowFileManager : true
                });
        });
</script>
</body>
</html>