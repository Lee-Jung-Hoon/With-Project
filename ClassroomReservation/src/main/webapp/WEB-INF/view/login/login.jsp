<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>로그인</title>
	<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
  <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/grids-responsive-min.css">
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layouts/marketing.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/spanner.css">
	<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/common.js"></script>
</head>
<body class="page-login">
<%@ include file="/WEB-INF/view/include/topBar.jsp"%>
<div class="content-wrapper" style="position:static; margin-top:62px">
    <div class="content">
		<form class="pure-form pure-form-aligned" action="${pageContext.request.contextPath}/login/login.do" method="post">
			<fieldset>
				<div class="pure-control-group">
					<label for="id">아이디</label>
					<input id="id" type="text" placeholder="아이디 입력" name="id" style="width:50%" required autofocus />
				</div>
				<div class="pure-control-group">
					<label for="password">Password</label>
					<input id="password" type="password" name="password" placeholder="비밀번호 입력" style="width:50%" required autofocus />
				</div>
				<input type="submit" id="loginBtn" class="pure-button pure-button-primary" value="로그인"  style="width:100%; margin:0 auto; border:0;" />
			</fieldset>
		</form>
	</div>
  <script type="text/javascript">footer()</script>
</div>
</body>
</html>
