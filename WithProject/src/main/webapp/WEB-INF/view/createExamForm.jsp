<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/WithProject/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/WithProject/css/style.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
<script>
$(document).ready(function() {
	$("#examTitle").on("mouseover", function () {
    $(this).css("border", "1px solid #ccc");
    $(this).parent().css("background", "#eee");
  });
	$("#examTitle").on("mouseout", function () {
    $(this).css("border", "1px solid white");
    $(this).parent().css("background", "white");
  });
	$(document).on("mouseover", "div>#examExplain", function () {
    $(this).css("border", "1px solid #ccc");
    $(this).parent().css("background", "#eee");
  });
	$(document).on("mouseout", "div>#examExplain", function () {
    $(this).css("border", "1px solid white");
    $(this).parent().css("background", "white");
  });
	$(".addBtn").on('click', function() {
    $(".addPanel").slideDown("slow");
  });
});
</script>
<title>Insert title here</title>
</head>
<body>
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
		<h1 style="height:50px; width: 60%; margin: 0 auto 0; margin-top: 50px; font-size: 20px;	font-weight: bold;">시험 개설</h1>
		<div style="width: 60%; border: 1px #ccc solid; margin: 0 auto 0; background: white; margin-bottom: 50px;">
			<div style="background: white; width: 100%; text-align: center; padding-bottom: 10px; padding-top: 10px;">
				<input type="text" id="examTitle" name="examTitle" value="시험-제목없음" 
					style="font-size:30px; box-sizing: border-box; font-weight:bold; width:90%; border:1px solid white;;"/>
			</div>
			<div style="background: white; width: 100%; text-align: center; padding-bottom: 10px; padding-top: 10px;">
				<input type="text" id="examExplain" name="examExplain" placeholder="시험지 설명" 
					style="box-sizing:border-box; font-size:15px; font-weight:bold; width:90%; border:1px solid white;"/>
			</div>
			
			<div class="addPanel" id="addPanel" style="width: 100%; height: 300px; border: 1px #bbb solid; z-index: 1; background: #fbfbfb;  box-shadow: 5px -5px 5px #bbb; display: none;">
				<button style="background:#eee; border: 1px solid #ccc; padding: 5px;  border-radius: 5px;">
					<img style=" width: 25px; background: #eee;" alt="" src="${pageContext.request.contextPath}/images/icon_delete.png"/>
				</button>
			</div>
			
			<div style="background: white; width: 100%; padding-left: 40px;  padding-bottom: 10px; padding-top: 10px;">
				<input type="button" class="addBtn" id="addBtn" value="항목 추가" style="padding: 5px;">
			</div>
		</div>
	</main>
</body>
</html>