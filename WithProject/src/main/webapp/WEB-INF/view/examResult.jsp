<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/view/include/common_top.jsp"%>
</head>
<body class="page-sub">
<%@ include file="/WEB-INF/view/include/common_header.jsp"%>
	<main>
	<div class="container">
		<h1>시험결과!!</h1>
		<div><h3>${score} 점</h3></div>
		<div>${chkNo}/${totalNo} (맞은수/총문제수)</div>
		<a href="${pageContext.request.contextPath}/exam/examList.do"><input type="button" value="돌아가기" /></a>
	</div>
	</main>
</body>
</html>