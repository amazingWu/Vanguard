<%@page import="com.vanguard.entity.Wisdom"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%String path=request.getContextPath(); 
	List<Wisdom> list=(List<Wisdom>)request.getAttribute("list");
%>
<script src="js/bootstrap.min.js"></script>

<div class="fields">
		<div class="container">
			<div id="myCarousel" class="carousel slide">
			   <!-- 轮播（Carousel）指标 -->
			   <ol class="carousel-indicators">
				 <%if(list.size()>3){ %>
				  <%for(int i=0;i<=list.size()/3;i++) {
				  		if(i==0){%>
				  			 <li data-target="#myCarousel" data-slide-to="<%=i %>" class="active"></li>
				  		<%}else{ %>
				  	 		 <li data-target="#myCarousel" data-slide-to="<%=i %>"></li>
				  	 	<%} %>
				  <%} %>
				 <%} %>
			   </ol>   
			   <!-- 轮播（Carousel）项目 -->
			   <div class="carousel-inner">
			   		<% for(int i=0;i<list.size();i++){
                    	if(i%3==0){
                    		if(i==0){%>
                    		<div class="fields-top item active">
								<div class="col-md-4 fields-left">
									<img width="90em" height="90em" alt="" src="<%=list.get(i).getWisdom_photo() %>"/>
									<h4><%=list.get(i).getWisdom_name() %></h4>
									<p><%=list.get(i).getWisdom_content() %></p>
								</div>
                    		<%}else{ %>
                    			<div class="clearfix"></div>
                    		</div>
                    		<div class="fields-top item">
								<div class="col-md-4 fields-left">
									<img width="90em" height="90em" alt="" src="<%=list.get(i).getWisdom_photo() %>"/>
									<h4><%=list.get(i).getWisdom_name() %></h4>
									<p><%=list.get(i).getWisdom_content() %></p>
								</div>
							<%}
                    		if(i==list.size()-1){%>
								<div class="clearfix"></div>
							</div>
							<%}
                    	}
                    	else{%>
                    		<div class="col-md-4 fields-left">
								<img width="90em" height="90em" alt="" src="<%=list.get(i).getWisdom_photo() %>"/>
								<h4><%=list.get(i).getWisdom_name() %></h4>
								<p><%=list.get(i).getWisdom_content() %></p>
							</div>
							<%if(i==list.size()-1){%>
								<div class="clearfix"></div>
							</div>
							<%}%>
                    	<%}
                    }%>			
			   </div>
				<%if(list.size()>3){ %>
					   <!-- 轮播（Carousel）导航 -->
			   <a class="carousel-control left" href="#myCarousel" 
				  data-slide="prev" style="font-size: 40px;color:black;">&lsaquo;</a>
			   <a class="carousel-control right" href="#myCarousel" 
				  data-slide="next" style="font-size: 40px;color:black;">&rsaquo;</a>
				<%} %>
			</div> 
		</div>
</div>