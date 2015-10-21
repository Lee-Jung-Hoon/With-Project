<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">WebSiteName</a>
		</div>
		<div style="height: 50px">
			<ul class="nav navbar-nav">
				<li class="active"><a href="${pageContext.request.contextPath}/ClassManage/RedirectMain.do">Home</a></li>
				<li><a href="${pageContext.request.contextPath}/user/reservation/rsvList.do">실시간 예약</a></li>
				<li><a href="${pageContext.request.contextPath}/ClassManage/ClassManage.do">강의실 관리</a></li>
				<li><a href="#">예약 내역</a></li>
				<li><a href="#">멤버 관리</a></li>
			</ul>
			<div align="right"
				style="text-align: right; height: 50px; line-height: 50px;">
				<c:choose>
					<c:when test="${empty userInfo}">
						<button type="button" class="btn btn-default btn-sm"  onclick="location.href='${pageContext.request.contextPath}/ClassManage/RedirectMemberJoin.do'">
							<span class="glyphicon glyphicon-plus"></span> Join
						</button>
						<button onclick="location.href='${pageContext.request.contextPath}/login/RedirectLogin.do'" type="button" class="btn btn-default btn-sm"
							style="vertical-align: middle;">
							<span class="glyphicon glyphicon-log-in"></span> Log in
						</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn btn-default btn-sm">
							<span class="glyphicon glyphicon-log-out"></span> Log out
						</button>
						<button type="button" class="btn btn-default btn-sm">
							<span class="glyphicon glyphicon-user"></span> MyPage
						</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</nav>