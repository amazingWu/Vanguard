<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s"  uri="/struts-tags"%>
<%String path=request.getContextPath(); %>
				<div class="col-md-3 blog-right">
					<div class="categories">
						<h3>推荐案例</h3>
						<ul>
							<s:iterator value="#request.indexlist">
								<li><a href="<%=path%>/Detail.action?id=<s:property value="example_id"/>"><s:property value="example_name"/></a></li>
							</s:iterator>
						</ul>
					</div>
				</div>