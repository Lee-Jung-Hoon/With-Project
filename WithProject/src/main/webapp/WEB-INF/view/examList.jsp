<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/WithProject/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/WithProject/css/style.css" />
<link rel="stylesheet" type="text/css" href="/WithProject/css/create-exam.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
<script>
$(document).ready(function() {
	$(".createExam").on('click', function() {
	  location.href='${pageContext.request.contextPath}/main/createExamForm.do';
  });
});
</script>
<title>Insert title here</title>
</head>
<body>
	<div class="dark-layer"></div>
	<header>
<!-- 		<div class="login-area"> -->
<!-- 			<div class="login"> -->
<!-- 				<form action="#" method="post"> -->
<!-- 					<dl class="list maki"> -->
<!-- 						<dt><a href="#" class="toggle">로그인</a></dt> -->
<!-- 						<dd class="fb-login"><em><a href="">페이스 북 로그인</a></em></dd> -->
<!-- 						<dd class="input-login"><em><input type="text" id="id" placeholder="ID" /></em></dd> -->
<!-- 						<dd class="input-login"><em><input type="password" id="pw" placeholder="password" /></em></dd> -->
<!-- 						<dd class="btn-login"><em><input type="submit" value="로그인"  /></em></dd> -->
<!-- 					</dl> -->
<!-- 				</form> -->
<!-- 			</div> -->
<!-- 		</div> -->
		</header>
		<main>
			<div class="content">
				<h1 class="title">최근 시험지</h1>
				<div class="ExamListDIV">
					<input type="button" value="시험 등록" class="createExam" id="createExam"/>
					
				</div>
			</div>
		</main>
</body>
</html>