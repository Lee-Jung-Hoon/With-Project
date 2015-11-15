<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>WITH 스터디</title>
<%@ include file="/WEB-INF/view/include/common_top.jsp"%>
</head>
<body class="page-main">
	<%@ include file="/WEB-INF/view/include/common_header.jsp"%>
	<main>
		<div class="search">
			<canvas id="c"></canvas>
			<canvas id="demo-canvas"></canvas>
			<canvas id="canvas"></canvas>
			<span class="title"><strong>Make <em>your</em> <em>Dream</em></strong>
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
	
			<div class="box-close">
				<button type="button" class="btn-close">
					<span class="front"></span> <span class="back"></span> <span
						class="right"></span> <span class="left"></span> <span class="top"></span>
					<span class="bottom"></span>
				</button>
			</div>
	
			<div class="tile">
				<span></span><span></span><span></span>
				<span></span><span></span><span></span>
				<span></span><span></span><span></span>
				<span></span><span></span><span></span>
			</div>
	
			<div class="list-content"></div>
		</div>
	</main>
	<%@ include file="/WEB-INF/view/include/main_bottom.jsp"%>
</body>
</html>
