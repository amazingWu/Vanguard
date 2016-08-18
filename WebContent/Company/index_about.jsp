<%@ page language="java" pageEncoding="utf-8"%>
<%String path=request.getContextPath(); %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!--welcome-starts--> 
	<div class="welcome">
		<div class="container">
			<%=request.getAttribute("index_about") %>
		</div>
	</div>
	<!--welcome-ends--> 