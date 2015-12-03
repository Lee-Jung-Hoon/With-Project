<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>일정 | WITH 스터디</title>
<%@ include file="/WEB-INF/view/include/common_top.jsp"%>
<style>
	.container .detail-wrap {
		overflow:hidden;
	}


	.container .detail-form {
		width:100%;
		border: 3px solid black;
		padding: 20px;
	}
	.container .detail-title {
	   font-size:30px;
	   margin:5px 0 10px;
	   font-weight:bold;
	   color: #4195f5;
	}
	.container .detail-container {
		width:55%;
		float:left;
	}
	.container .detailInfo-container {
		width:40%;
		float:right;
	}
	
	.container .detailInfo-form {
		width:100%;
		border: 3px solid black;
		padding: 20px;
	}
	
	
</style>
</head>
<body class="page-sub" id="page-sub">
	<%@ include file="/WEB-INF/view/include/common_header.jsp"%>
	<main>
		<div class="container">
		<c:set var="referenceVO" value="${referenceVO}" />
			<h3 class="title">자료상세화면</h3>
			<div class="detail-wrap">
						<div class="detail-container">
							<div class="detail-title">파일내용</div>
							<div class="detail-form">${referenceVO.referenceFile}</div>
						</div>
						<div class="detailInfo-container">
							<div class="detail-title">파일상세정보</div>
							<div class="detailInfo-form"></div>
						</div>
				</div>
				
		</div>
	</main>
</body>
</html>
