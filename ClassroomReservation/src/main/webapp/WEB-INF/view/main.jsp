<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>비트 교육센터 강의 예약</title>
	<%@ include file="/WEB-INF/view/include/common.jsp"%>
	<script>
		$(document).ready(function(){
		  $(".nav .home").addClass("active");
		});
	</script>
	<style>
		.footer {
			position:static;
		}
	</style>
</head>
<body>
	<%@ include file="/WEB-INF/view/include/topBar.jsp"%>
	<div class="content-wrapper"
		style="position: static;">
		<div class="content" style="height:600px; width:1200px; margin:0 auto; border: 1px solid black; margin-bottom:40px;">
			<iframe width="600" height="337" src="https://www.youtube.com/embed/SESuctdE9vM?autoplay=1" frameborder="0" allowfullscreen></iframe>
			<div style="width:555px; height:337px; box-sizing:border-box; padding-top:40px; float:right;">
				<img src="http://www.bitcamp.co.kr/image/main/main_img.jpg" style="width:100%; vertical-align:middle;" alt="입학이 긍지가 되고 수료가 날개가 되는 상위 1% 전문가를 위한 교육" />
				<img src="http://www.bitcamp.co.kr/image/common/subTopImg.png" style="width:100%; vertical-align:middle;" alt="입학이 긍지가 되고 수료가 날개가 되는 상위 1% 전문가를 위한 교육" />
			</div>
			<img src="${pageContext.request.contextPath}/img/logo2.png" alt="" />
			
			<!-- 
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>

				
				<div class="carousel-inner" role="listbox">
					<div class="item active"><img src="${pageContext.request.contextPath}/img/bit_img1.jpg" alt="bit_img1" /></div>
					<div class="item"><img src="${pageContext.request.contextPath}/img/bit_img04.jpg" alt="bit_img04" /></div>
					<div class="item"><img src="${pageContext.request.contextPath}/img/bit_img3.jpg" alt="bit_img3" /></div>
				</div>

				
				<a class="left carousel-control" href="#myCarousel" role="button"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel" role="button"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
			 -->
			

		</div>
		<script type="text/javascript">footer()</script>
	</div>
</body>
</html>
