 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
	<%
// 		response.sendRedirect("/WithProject/main/main.do");
	%>
	<a href="${pageContext.request.contextPath}/main/main.do">메인</a>
	<a href="${pageContext.request.contextPath}/main/map.do">내 주변 스터디그룹 맵</a>
	<a href="${pageContext.request.contextPath}/main/mapTest.do">스터디그룹 등록시 사용 맵</a>
	<a href="${pageContext.request.contextPath}/main/login.do">로그인</a>
	<a href="${pageContext.request.contextPath}/main/d3jsTest.do">D3</a>
	<a href="${pageContext.request.contextPath}/main/WebRTC.do">WebRTC</a>
	<a href="${pageContext.request.contextPath}/exam/examList.do">시험 테스트</a>
	<a href='${pageContext.request.contextPath}/calendar/schedule.do'>일정</a>
</body>