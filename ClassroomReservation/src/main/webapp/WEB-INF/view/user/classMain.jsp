<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>강의실 예약</title>
	<%@ include file="/WEB-INF/view/include/common.jsp"%>
	<style>
.content {
	overflow: hidden;
	position: relative;
}

h1 {
font-size: 25px;
    border: 2px solid gray;
    border-left: 0;
    border-right: 0;
    line-height: 40px;
    margin: .67em 0;
}

.insertButton {
position: absolute;
    top: 110px;
    left: 400px;
}

.content > div {
	width: 150px;
	height: 150px;
	padding: 1em;
	background: white;
	position: absolute;
	background-image: url("https://image.freepik.com/free-icon/classroom-projector_318-86200.jpg");
  background-position: center;
  background-repeat: no-repeat;
  color: black;
  border: 1px black solid;
  text-decoration: none;
}

.content > table {
	width: 60px;
	height: 100px;
	padding: 1em;
	background: white;
	position: absolute;
  color: black;
}

</style>
<script>  
  $(document).ready(function() {
    classList("${floor}");
 		
    // 강의실을 불러올 부분 (ajax)
    function classList(no) {
    	$.ajax({
  			url : "/ClassroomReservation/ClassManage/classList.json",
  			dataType : "json",
  			data:"floor="+no
  		})
  		.done(function(response){
  			console.log(response);
  			var divHtml = "";
  			response.forEach(function (classReservationVO, index){
  			  divHtml = "";
  			  divHtml += "<div class='class_"+classReservationVO.classNo+"' style='left:"+classReservationVO.classLeft+"px; top:"+classReservationVO.classTop+"px;' >" 
  			  divHtml += "<a href='/ClassroomReservation/reservation/dateReservation.do?classNo="+classReservationVO.classNo+"&floor=" + classReservationVO.floor +"&className=" +classReservationVO.className+"&classDetail="+classReservationVO.classDetail+"&classPerson="+classReservationVO.classPerson+"'>"+classReservationVO.className+"</a></div>"
  			    $(".content").append(divHtml);
  			});
  		});
    }
    
    $(".nav .res").addClass("active");
    
  });
  
</script>
</head>
<body>
	<%@ include file="/WEB-INF/view/include/topBar.jsp" %>	
	<div class="content-wrapper" style="position: static;">
	<div class="content" style="height: 600px; width: 90%; margin: 0 auto; border: 1px solid black; margin-bottom: 40px;">
	<h1>강의실 관리 메뉴</h1>
		<!-- 층수 선택 버튼 -->
		<ul class="pagination">
  		<li><a href="classReservation.do?floor=1">1층</a></li>
  		<li><a href="classReservation.do?floor=2">2층</a></li>
			<!-- class="active" -->
  		<li><a href="classReservation.do?floor=3">3층</a></li>
  		<li><a href="classReservation.do?floor=4">4층</a></li>
  		<li><a href="classReservation.do?floor=5">5층</a></li>
  		<li><a href="classReservation.do?floor=6">6층</a></li>
  		<li><a href="classReservation.do?floor=7">7층</a></li>
  		<li><a href="classReservation.do?floor=8">8층</a></li>
		</ul>
	</div>
		<script type="text/javascript">footer()</script>	
	</div>
</body>
</html>
