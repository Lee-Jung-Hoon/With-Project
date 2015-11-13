<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>제목</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/reset.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style.css" />
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/js/main.function.js"></script>
<script src="http://www.google.com/jsapi"></script>
<script src="${pageContext.request.contextPath}/js/tag.cloud.js"></script>
<script src="${pageContext.request.contextPath}/js/main.tag.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.pinto.js"></script>
<script src="${pageContext.request.contextPath}/js/circle.js"></script>
<script src="${pageContext.request.contextPath}/js/menu.action.js"></script>
<script type="text/javascript"
	src="http://apis.daum.net/maps/maps3.js?apikey=ed9f2771750f83351d39d6973594a653"></script>
<script src="http://d3js.org/d3.v3.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/gsap/latest/TweenMax.min.js"></script>
<script src="${pageContext.request.contextPath}/js/node.action.js"></script>
</head>
<body>
	<div class="dark-layer"></div>
	<header>
		<div class="bookmarkZone" style="border: 2px white dashed;
    /* width: 10%; */
    /* height: 100%; */
    position: absolute;
    /* left: 1000px; */
    right: 400px;
    top: 50%;
    width: 10%;
    height: 50px;
        border-radius: 10px;
    color: white;
    font-size: 30px;
    text-align: center;
    margin-top: -25px;">즐겨찾기</div>
		<div class="login-area">
			<div class="login">
				<form action="#" method="post">
					<dl class="list maki">
						<dt>
							<a href="#" class="toggle">로그인</a>
						</dt>
						<dd class="fb-login">
							<em><a href="">페이스 북 로그인</a></em>
						</dd>
						<dd class="input-login">
							<em><input type="text" id="id" placeholder="ID" /></em>
						</dd>
						<dd class="input-login">
							<em><input type="password" id="pw" placeholder="password" /></em>
						</dd>
						<dd class="btn-login">
							<em><input type="submit" value="로그인" /></em>
						</dd>
					</dl>
				</form>
			</div>
		</div>
	</header>
	<main>
	<div class="search">
		<canvas id="c"></canvas>
		<canvas id="demo-canvas"></canvas>
		<canvas id="canvas"></canvas>
		<span class="title"> <strong>Make <em>your</em> <em>Dream</em></strong>
			<input type="text" id="keyword" name="keyword" />
			<button class="searchIcon" type="button">
				<img src="${pageContext.request.contextPath}/images/icon_search.png"
					alt="" />
			</button>
		</span>
		<div id="tcdiv"></div>
	</div>
	<div id="container" class="img-layer">
		<div class="img-wrap" id='crateGroup'
			style="border-radius: 15px; border: 4px solid #105a8b; background: url(http://www.hanium.or.kr/images/egovframework/main/bg_member_block_icon.png) no-repeat 0 -400px; height: 200px;">
			<div
				style="color: white; font-size: 30px; /* text-align: center; */ position: absolute; top: 120px; left: 17px;">스터디
				개설</div>
		</div>
	</div>

	<div class="box">

		<div class='box-close'>
			<button type='button' class='btn-close'>
				<span class='front'></span> <span class='back'></span> <span
					class='right'></span> <span class='left'></span> <span class='top'></span>
				<span class='bottom'></span>
			</button>
		</div>

		<div class='tile'>
			<span class=''></span> <span class=''></span> <span class=''></span>
			<span class=''></span> <span class=''></span> <span class=''></span>
			<span class=''></span> <span class=''></span> <span class=''></span>
			<span class=''></span> <span class=''></span> <span class=''></span>
		</div>

		<div class='list-content'>
		</div>
	</div>
	</main>
</body>
</html>
