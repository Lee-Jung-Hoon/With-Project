<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>일정 | WITH 스터디</title>
<%@ include file="/WEB-INF/view/include/common_top.jsp"%>
<script>
$(document).ready(function() {
	$(".createExam").on('click', function() {
	  location.href='${pageContext.request.contextPath}/exam/createExamForm.do?groupNo=${groupNo}'
  });
});
</script>
</head>
<body class="page-sub">
	<%@ include file="/WEB-INF/view/include/common_header.jsp"%>
		<main>
			<div class="container">
				<h3 class="title">출석 체크</h3>
				<img src="/WithProject/images/qrcode_73.png" alt="qrcode">
			</div>
		</main>
</body>
</html>