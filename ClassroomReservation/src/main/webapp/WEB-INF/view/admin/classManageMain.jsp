<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>강의실 관리</title>
<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/grids-responsive-min.css">
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layouts/marketing.css">
<style>
.class {
	width: 150px; 
	height: 150px; 
	padding: 1em;
	background: white;
	position:fixed;
}
</style>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
$(document).ready(function(){
	$('.btn-class').on('click', function() {
	  $("<div class='class'>강의실</div>")
		.appendTo('.content').draggable();
	});
	$('.btn-info').on('click', function() {
	  alert($(".class").css('left'));
	  alert($(".class").css('top'));
  });
	$('.class').on('drop', function () {
    alert("!!!!");
  });
});


</script>

</head>
<body>
	<div class="header">
		<div class="home-menu pure-menu pure-menu-horizontal pure-menu-fixed">
			<a class="pure-menu-heading" href="">Your Site</a>
			<ul class="pure-menu-list">
				<li class="pure-menu-item pure-menu-selected"><a href="#"	class="pure-menu-link">Home</a></li>
				<li class="pure-menu-item"><a href="#" class="pure-menu-link">Tour</a></li>
				<li class="pure-menu-item"><a href="#" class="pure-menu-link">Sign Up</a></li>
			</ul>
		</div>
	</div>
	<div class="content-wrapper" style="position: static; margin-top: 62px;">
		<h1>강의실 관리 메뉴</h1>
		<div class="content" style="background: black; height: 600px; border: 1px solid black;">
			<button type="button" class="btn-class">강의실 생성</button>
			<button type="button" class="btn-info">강의실 정보</button>
		</div>
		<div class="footer l-box is-center"> 열심히 해봅시다! </div>
	</div>
</body>
<div style="display: none; bo">
	<input type="text" si>
</div>
</html>
