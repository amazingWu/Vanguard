<%@page import="com.vanguard.entity.Example"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<% 
String path=request.getContextPath();
List<Example> list=(List<Example>)request.getAttribute("headlist"); %>
<%@ taglib prefix="s" uri="/struts-tags" %>
	<!--banner-starts-->
	<div class="banner" id="home">
		<div class="container">
			<section class="slider">
                <div class="flexslider">
                    <ul class="slides">
                    	<% for(int i=0;i<list.size();i++){
                    	if(i%2==0){%>
                    	<li>
							<div class="banner-top">
								<div class="col-md-6 banner-left">
									<div class="bnr-one">
										<img src="<%=list.get(i).getExample_photo()%>" alt="<%=list.get(i).getExample_photo()%>" />
										<h3><%=list.get(i).getExample_name()%></h3>
										<a href="<%=path%>/Detail.action?id=<%=list.get(i).getExample_id() %>">了解更多</a>
									</div>
								</div>
							<%if(i==list.size()-1){%>
							</div>
						</li>
							<%}
                    	}
                    	else{%>
                    			<div class="col-md-6 banner-left">
									<div class="bnr-one">
										<img src="<%=list.get(i).getExample_photo()%>" alt="<%=list.get(i).getExample_photo()%>" />
										<h3><%=list.get(i).getExample_name()%></h3>
										<a href="<%=path%>/Detail.action?id=<%=list.get(i).getExample_id() %>">了解更多</a>
									</div>
								</div>
							</div>
						</li>
                    	<%}
                    }%>
					</ul>
				</div>
			</section>
		</div>
	</div>
	<!--banner-ends--> 
		<!--FlexSlider-->
	<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
	<script defer src="js/jquery.flexslider.js"></script>
	<script type="text/javascript">
    $(function(){
      SyntaxHighlighter.all();
    });
    $(window).load(function(){
      $('.flexslider').flexslider({
        animation: "slide",
        start: function(slider){
          $('body').removeClass('loading');
        }
      });
    });
  </script>