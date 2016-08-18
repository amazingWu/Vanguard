<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%String path=request.getContextPath(); %>
<div class="offer">
	<div class="container">
			<div class="offer-top heading">
				<h2 class="example">案例展示<a class="more-example" href="ExampleList.action">更多展示&gt;&gt;</a></h2>
				
			</div>
			<div class="offer-bottom">
				<s:iterator value="#request.indexlist">
					<div class="col-md-3 offer-left">
						<a href="<%=path%>/Detail.action?id=<s:property value="example_id"/>"><img src=<s:property value="example_photo"/> alt=""></a>
						<h4><a href="<%=path%>/Detail.action?id=<s:property value="example_id"/>"><s:property value="example_name"/></a></h4>
						<p><s:property value="example_about"/></p>
						<div class="o-btn">
							<a href="<%=path%>/Detail.action?id=<s:property value="example_id"/>">了解更多</a>
						</div>
					</div>
				</s:iterator>
				
				
				<div class="clearfix"></div>
			</div>
		</div>
</div>
