<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width">
	<title>제목</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.function.js"></script>
	<script type="text/javascript" src="http://www.google.com/jsapi"></script>
	<script src="${pageContext.request.contextPath}/js/tag.cloud.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.tag.js"></script>
</head>
<body>
	<div class="dark-layer"></div>
	<header>
		<div class="login-area">
			<div class="login">
				<form action="#" method="post">
					<dl class="list maki">
						<dt><a href="#" class="toggle">로그인</a></dt>
						<dd class="fb-login"><em><a href="">페이스 북 로그인</a></em></dd>
						<dd class="input-login"><em><input type="text" id="id" placeholder="ID" /></em></dd>
						<dd class="input-login"><em><input type="password" id="pw" placeholder="password" /></em></dd>
						<dd class="btn-login"><em><input type="submit" value="로그인"  /></em></dd>
					</dl>
				</form>
			</div>
		</div>
	</header>
	<main>
		<div class="search">
			<canvas id="c"></canvas>
		  <canvas id="demo-canvas"></canvas>
			<span class="title">
				<strong>Make <em>your</em> <em>Dream</em></strong>
				<input type="text" id="keyword"  name="keyword" />
				<button class="searchIcon" type="button"><img src="${pageContext.request.contextPath}/images/icon_search.png" alt="" /></button>
			</span>
			<div id="tcdiv"></div>
		</div>
		<div id="container" class="img-layer">

			<div class="img-wrap" style="height:200px; background:red;">
				
			</div>
			
		</div>
			
		</div>
		<div class="box">
			<div class="box-close">
				<button type="button" class="btn-close">
					<span class="front"></span>
					<span class="back"></span>
					<span class="right"></span>
					<span class="left"></span>
					<span class="top"></span>
					<span class="bottom"></span>
				</button>
			</div>
			<div class="tile">
				<span class=""></span>
				<span class=""></span>
				<span class=""></span>
				<span class=""></span>
				<span class=""></span>
				<span class=""></span>
				<span class=""></span>
				<span class=""></span>
				<span class=""></span>
				<span class=""></span>
				<span class=""></span>
				<span class=""></span>
			</div>
			<div class="list-content">					
				<div class="roll-btn-wrap"><button type="button" class="roll-btn roll-btn-left"><span class="left"></span></button></div>
				<div class="roll-btn-wrap"><button type="button" class="roll-btn roll-btn-right"><span class="right"></span></button></div>
					<div class="img-rolling">
						<ul>
							<li><img src="${pageContext.request.contextPath}/images/sample.jpg" alt="" /></li>
							<li><img src="${pageContext.request.contextPath}/images/sample1.jpg" alt="" /></li>
							<li><img src="${pageContext.request.contextPath}/images/sample2.jpg" alt="" /></li>
							<li><img src="${pageContext.request.contextPath}/images/sample3.jpg" alt="" /></li>
							<li><img src="${pageContext.request.contextPath}/images/sample4.jpg" alt="" /></li>
							<li><img src="${pageContext.request.contextPath}/images/sample5.jpg" alt="" /></li>
						</ul>
					</div>
					<div class="img-rolling-s">
						<span class="current"></span>
						<ul>
							<li><a href="#"><img src="${pageContext.request.contextPath}/images/sample.jpg" alt="" /></a></li>
							<li><a href="#"><img src="${pageContext.request.contextPath}/images/sample1.jpg" alt="" /></a></li>
							<li><a href="#"><img src="${pageContext.request.contextPath}/images/sample2.jpg" alt="" /></a></li>
							<li><a href="#"><img src="${pageContext.request.contextPath}/images/sample3.jpg" alt="" /></a></li>
							<li><a href="#"><img src="${pageContext.request.contextPath}/images/sample4.jpg" alt="" /></a></li>
							<li><a href="#"><img src="${pageContext.request.contextPath}/images/sample5.jpg" alt="" /></a></li>
						</ul>
					</div>
					<div class="list-txt">
						텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플
					</div>
			</div>
		</div>
	</main>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.pinto.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/circle.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/menu.action.js"></script>
</body>
</html>
