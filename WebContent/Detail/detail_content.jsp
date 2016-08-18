<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s"  uri="/struts-tags"%>
<%String path=request.getContextPath();%>

<style typ="text/css">
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
<script type="text/javascript">
function jump(example_id){
	var index=document.getElementById("index_num").value;
	ajaxRequest(example_id,index);
}

//javascript ajax
function ajaxRequest(example_id,index) {
	var xmlHttpRequest = null;
    if (window.ActiveXObject) // IE浏览器
    {
        xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
    }
    else if (window.XMLHttpRequest) // 除IE以外的其他浏览器
    {
        xmlHttpRequest = new XMLHttpRequest();
    }
    if (null != xmlHttpRequest) {
        xmlHttpRequest.open("post", "RelatedComment.action",true);
        xmlHttpRequest.onreadystatechange = function() {
            if (xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200) {
                document.getElementById("comments").innerHTML = xmlHttpRequest.responseText;
              }
        };
        xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
        xmlHttpRequest.send("example_id="+example_id+"&current_index="+index);
    }
}
function add_comment_check(){

	
	if(check()){
		document.getElementById("comment_form").submit();
	}
}
function check(){
	document.getElementById("name_p").innerHTML="";
	document.getElementById("email_p").innerHTML="";
	document.getElementById("phone_p").innerHTML="";
	document.getElementById("content_p").innerHTML="";
	
	var name=document.getElementById("comment_name").value;
	if(name.length>15){
		document.getElementById("name_p").innerHTML="用户名不能超过15位";
		return false;
	}
	var email=document.getElementById("comment_email").value;
	 //对电子邮件的验证
	 var myreg = /^\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}$/;
	if(email!=null&&email!=""){
		if(!myreg.test(email)){
			document.getElementById("email_p").innerHTML="请输入正确的邮箱格式";
			return false;
		}
	}
	var phone=document.getElementById("comment_phone").value;
	//手机号验证
	var isPhone = /^0?(13|14|15|18)[0-9]{9}$/;
	var ismob=/^(^0\d{2}-?\d{8}$)|(^0\d{3}-?\d{7}$)|(^\(0\d{2}\)-?\d{8}$)|(^\(0\d{3}\)-?\d{7}$)|(\d{2,5}-\d{7,8})|(\d{2,5}\d{7,8})$/;
    if(phone!=null&&phone!=""){
    	 if(!isPhone.test(phone)&&!ismob.test(phone)){
    		 document.getElementById("phone_p").innerHTML="请输入正确的电话格式";  
    		 return false;
    	 }
    }
    var content=document.getElementById("comment_content").value;
    if(content.length>300){
    	document.getElementById("content_p").innerHTML="评论内容不能超过300字";  
    	return false;
    }
    return true;
}

</script>
<div class="blog">
		<div class="container">
			<div class="blog-head heading"></div>	
			<div class="blog-top">
				<div class="col-md-9 blog-left">
					<div class="blog-main">
						<a class="bg">${example.example_name }</a>
						<p>设计师：<a>${example.example_author }</a> 推送时间：<%=request.getAttribute("time") %></p>
					</div>
					<div class="blog-main-one">
						<article class="blog-one">
						${example.example_content }
						</article>	
						<div class="clearfix"></div>
						<div class="blog-comments">
							<ul>
								<li><span class="glyphicon glyphicon-bookmark" aria-hidden="true"></span><a>威嘉装饰</a></li>
								<li><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span><p><%=request.getAttribute("time") %></p></li>
								<li><span class="glyphicon glyphicon-user" aria-hidden="true"></span>设计师：<p>${example.example_author }</p></li>
							</ul>
							<div class="clearfix"></div>
						</div>
					</div>
					<!-- 评论区 --> 
					<div id="comments">
						<s:action name="RelatedComment" executeResult="true">
							<s:param name="example_id">${example.example_id }</s:param>
							<s:param name="current_index">1</s:param>
						</s:action>
					</div>
					<div class="reply heading">
					 		<h4>我也要留言：</h4>
					 		<div class="contact-form">
					 			
								<form id="form_comment" onsubmit="return check()" action="AddComment" method="post">
									<input type="text" id="comment_name" name="comment.comment_name" placeholder="昵称（必填）" required/><p id="name_p"></p>
									<input type="text" id="comment_email" name="comment.comment_email" placeholder="邮箱"/><p id="email_p"></p>
									<input type="text" id="comment_phone" name="comment.comment_phone" placeholder="电话"/><p id="phone_p"></p>
									<input type="text" style="display:none;" name="comment.example_id" value="${example.example_id }"/>
									<textarea id="comment_content" name="comment.comment_content" placeholder="留言内容（必填，最多输入300字）" required></textarea><p id="content_p"></p>
									<input type="submit"  value="提交"/>
				   				</form>
				   			</div>	
					</div>
			</div>
			<!-- 相关列表 -->
			<s:action name="RelatedExample" executeResult="true"></s:action>
		
			<!-- 相关列表结束 -->
			<div class="clearfix"></div>
		</div>
	</div>
</div>