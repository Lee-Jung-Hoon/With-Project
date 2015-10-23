<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원가입</title>
	<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
  <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/grids-responsive-min.css">
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layouts/marketing.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/spanner.css">
	<script src="${pageContext.request.contextPath}/js/common.js"></script>
	<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<style>
		form {
	    width: 400px;
	    margin: 0 auto 40px;
	    margin-bottom: 20px;
		}
		.pure-form fieldset {
	    margin: 0;
	    padding: .35em 25px .75em;
	    border: 2px solid gray;
	    border-radius: 15px;
	}
	</style>
</head>
<body class="page-login">
<%@ include file="/WEB-INF/view/include/topBar.jsp"%>
<div class="content-wrapper" style="position:static; margin-top:62px">
    <div class="content">
		<form class="pure-form pure-form-aligned" action="${pageContext.request.contextPath}/login/login.do" method="post">
			<fieldset>
				<h1>회원가입</h1>				
				<div class="pure-control-group">
					<label for="id">아이디(이메일)</label>
					<input id="id" type="email" placeholder="아이디 입력" name="id" style="width:90%" required autofocus />
				</div>
				<div class="pure-control-group">
					<label for="password">비밀번호</label>
					<input id="password" type="password" name="password" placeholder="비밀번호 입력" style="width:90%" required autofocus />
				</div>
				
				<div class="pure-control-group">
					<label for="password">비밀번호 확인</label>
					<input id="password" type="password" name="rePassword" placeholder="비밀번호 입력" style="width:90%" required autofocus />
				</div>
				<div class="pure-control-group">
					<label for="name">이름</label>
					<input id="name" type="text" name="name" placeholder="이름 입력" style="width:90%" required autofocus />
				</div>
				<input type="submit" id="loginBtn" class="pure-button pure-button-primary" value="가입"  style="width:100%; margin:0 auto; border:0;" />
			</fieldset>
		</form>
	</div>
  <script type="text/javascript">footer()</script>
</div>
</body>
</html>
