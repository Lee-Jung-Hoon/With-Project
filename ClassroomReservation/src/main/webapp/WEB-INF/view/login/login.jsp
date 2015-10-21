<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body class="page-login">
<div class="header">
    <div class="home-menu pure-menu pure-menu-horizontal pure-menu-fixed">
        <a class="pure-menu-heading" href="">Your Site</a>

        <ul class="pure-menu-list">
            <li class="pure-menu-item pure-menu-selected"><a href="#" class="pure-menu-link">Home</a></li>
            <li class="pure-menu-item"><a href="#" class="pure-menu-link">Tour</a></li>
            <li class="pure-menu-item"><a href="#" class="pure-menu-link">Sign Up</a></li>
        </ul>
    </div>
</div>
<div class="content-wrapper" style="position:static; margin-top:62px">
    <div class="content">
		<form class="pure-form pure-form-aligned" action="${pageContext.request.contextPath}/login/login.do" method="post">
			<fieldset>
				<div class="pure-control-group">
					<label for="name">아이디</label>
					<input id="name" type="text" placeholder="아이디 입력" style="width:50%" />
				</div>
				<div class="pure-control-group">
					<label for="password">Password</label>
					<input id="password" type="password" placeholder="비밀번호 입력" style="width:50%" />
				</div>
				<input type="submit" class="pure-button pure-button-primary" value="로그인"  style="width:100%; margin:0 auto; border:0;" />
			</fieldset>
		</form>
	</div>
    <div class="footer l-box is-center">
        View the source of this layout to learn more. Made with love by the YUI Team.
    </div>
</div>
</body>
</html>
