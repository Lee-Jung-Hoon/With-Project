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
</head>
<body>
	<%@ include file="/WEB-INF/view/include/topBar.jsp"%>
	<div class="content-wrapper"
		style="position: static; margin-top: 40px;">
		<div class="content" style="height: 600px; width: 90%; margin: 0 auto; border: 1px solid black; margin-bottom: 40px;">

			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="${pageContext.request.contextPath}/img/bit_img1.jpg" alt="bit_img1" style="width: 80%;">
					</div>

					<div class="item">
						<img src="${pageContext.request.contextPath}/img/bit_img04.jpg" alt="bit_img04" style="width: 80%;">
					</div>

					<div class="item">
						<img src="${pageContext.request.contextPath}/img/bit_img3.jpg" alt="bit_img3" style="width: 80%;">
					</div>
				</div>

				<!-- Left and right controls -->
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

		</div>
		<script type="text/javascript">footer()</script>
	</div>
</body>
</html>
