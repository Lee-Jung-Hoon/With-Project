<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>로그인</title>
	<%@ include file="/WEB-INF/view/include/common.jsp"%>
</head>
<body class="page-login">
<%@ include file="/WEB-INF/view/include/topBar.jsp"%>
<div class="content-wrapper" style="position:static;">
  <div class="content" style="margin-top:50px">
   	<div style="width:440px; margin:0 auto; padding:0 20px 10px; background:#f4f4f4;">
   		<h1 style="width:100%; margin-top:0; padding:20px 0; border-bottom:2px solid #000;">로그인</h1>
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
	</div>
  <script type="text/javascript">footer()</script>
</div>
</body>
</html>
