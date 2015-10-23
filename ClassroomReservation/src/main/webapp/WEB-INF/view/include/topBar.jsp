<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-inverse">
<div class="container-fluid">
	<div class="navbar-header" style="height:50px; line-height:50px" >
		<img src="${pageContext.request.contextPath}/img/logo.png" alt="비트 교육센터" />
	</div>
	<div style="height: 50px">
		<ul class="nav navbar-nav" style="margin-left:30px;">
			<li class="home"><a href="${pageContext.request.contextPath}/ClassManage/RedirectMain.do">Home</a></li>
				<c:if test="${grade eq 0}">
					<li class="res"><a href="${pageContext.request.contextPath}/reservation/classReservation.do">실시간 예약</a></li>
				</c:if>
				
				<c:if test="${grade eq 1}">
					<li class="room"><a href="${pageContext.request.contextPath}/ClassManage/ClassManage.do">강의실 관리</a></li>
				</c:if>
		</ul>
		<div align="right"
			style="text-align: right; height: 50px; line-height: 50px;">
			<c:choose>
				<c:when test="${empty userInfo}">
					<button type="button" class="btn btn-default btn-sm"
						onclick="location.href='${pageContext.request.contextPath}/ClassManage/RedirectMemberJoin.do'">
						<span class="glyphicon glyphicon-plus"></span> Join
					</button>
					<button
						onclick="location.href='${pageContext.request.contextPath}/login/RedirectLogin.do'"
						type="button" class="btn btn-default btn-sm"
						style="vertical-align: middle;">
						<span class="glyphicon glyphicon-log-in"></span> Log in
					</button>
				</c:when>
				<c:otherwise>
					<button
						onclick="location.href='${pageContext.request.contextPath}/login/logout.do'"
						type="button" class="btn btn-default btn-sm">
						<span class="glyphicon glyphicon-log-out"></span> Log out
					</button>
					<button
						onclick="location.href='${pageContext.request.contextPath}/login/mypage.do'"
						type="button" class="btn btn-default btn-sm">
						<span class="glyphicon glyphicon-user"></span> MyPage
					</button>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
</nav>