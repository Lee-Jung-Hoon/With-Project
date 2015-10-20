<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>강의실 관리</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/grids-responsive-min.css">
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layouts/marketing.css">
<script src="${pageContext.request.contextPath}/js/jquery.colorbox.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/colorbox.css" />



</head>

<style>
.content {
	overflow: hidden;
	position: relative;
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
  var cnt = 0;
  $(document).ready(function() {
   	classList("${floor}");
    // 강의실 등록 컬러박스
    $(".insertClass").colorbox({
      iframe : true,
      title : "강의실 등록",
      width : "60%",
      height : "60%"
    });
    
    // 강의실 정보 저장을 위한 이벤트 수행
    function saveEvent(no) {
      var divClass = $(".class_"+no);
			
  
      $(divClass).on("mouseup", function() {
        // left 0 이하로 떨어질 경우 0으로 되돌려주는 부분
        if(parseInt($(".class_" + no).css('left')) < 0) {
          divClass.css('left', '0px');
        }

        // top 0 이하로 떨어질 경우 0으로 되돌려주는 부분
        if(parseInt($(".class_" + no).css('top')) < 0) {
          divClass.css('top', '0px');
        }

				// 강의실이 Right 최대치를 벗어나지 않도록
        if(parseInt($(".class_" + no).css('left')) > 1440) {
          divClass.css('left', '1430px');
        }
				// 강의실이 Bottom 최대치를 벗어나지 않도록
        if(parseInt($(".class_" + no).css('top')) > 449) {
          divClass.css('top', '440px');
        }
				
				// 강의실 위치 정보 저장
				var array = [$(".class_" + no).css('left'), $(".class_" + no).css('top'), no];
				$.ajax({
					url : "classSave.json",
					dataType : "json",
					data: "array="+array
				})
				.done(function () {
		      $(".classMenu_"+no).css("left", ($(".class_" + no).css('left')+75)+"px");
		      $(".classMenu_"+no).css("top", ($(".class_" + no).css('top')+75)+"px");
        })
    	});
    }
 		
    // 강의실을 불러올 부분 (ajax)
    function classList(no) {
    	$.ajax({
  			url : "classList.json",
  			dataType : "json",
  			data:"floor="+no
  		})
  		.done(function(response){
  			console.log(response);
  			var divHtml = "";
  			response.forEach(function (ClassManageVO, index){
  			  divHtml = "";
  			  divHtml += "<div class='class_"+ClassManageVO.classNo+"' style='left:"+ClassManageVO.classLeft+"px; top:"+ClassManageVO.classTop+"px;' >" 
  			  divHtml += "<a href='#' onclick='showMenu(" + ClassManageVO.classNo + ")'>"+ClassManageVO.className+"</a></div>"
  			  divHtml += "<table border='1' class='classMenu_" + ClassManageVO.classNo + "' style=' display:none; left:"+(ClassManageVO.classLeft+75)+"px; top:"+(ClassManageVO.classTop+75)+"px;' >"
  			  divHtml += "<tr><td>수정</td></tr>"
 			    divHtml += "<tr><td><a href='#' onclick='classDel("+ClassManageVO.classNo+")'>삭제</a></td></tr>"
  			  divHtml += "</table>"
  			  $(".content").append(divHtml).find(".class_" +ClassManageVO.classNo).draggable();
  	      saveEvent(ClassManageVO.classNo);
  			});
  		});
    }
  });
  
	
  
  function showMenu(no) {
    if($(".classMenu_"+no).css("display") == "none") {
      $(".classMenu_"+no).show();
    }
    else {
      $(".classMenu_"+no).hide();
    }
  }
  
  function classDel(no) {
  	$.ajax({
			url : "classDel.json",
			dataType : "json",
			data:"classNo=" + no
		})
		.done(function(response){
			$(".class_" + no).remove();
			$(".classMenu_" + no).remove();
			alert(response);
		});
  }
  
</script>
<body>
	<%@ include file="/WEB-INF/view/include/topBar.jsp" %>	
	<div class="content-wrapper" style="position: static; margin-top: 62px;">
		<h1>강의실 관리 메뉴</h1>
		<!-- 층수 선택 버튼 -->
		<input type="button" value="1층" onclick="location.href='ClassManage.do?floor=1'">
		<input type="button" value="2층" onclick="location.href='ClassManage.do?floor=2'">
		<input type="button" value="3층" onclick="location.href='ClassManage.do?floor=3'">
		<input type="button" value="4층" onclick="location.href='ClassManage.do?floor=4'">
		<input type="button" value="5층" onclick="location.href='ClassManage.do?floor=5'">
		<input type="button" value="6층" onclick="location.href='ClassManage.do?floor=6'">
		<input type="button" value="7층" onclick="location.href='ClassManage.do?floor=7'">
		<input type="button" value="8층" onclick="location.href='ClassManage.do?floor=8'">
		
		<div class="content" style="background: tomato; height: 600px; border: 1px solid black;">
		<button><a class="insertClass" href='/ClassroomReservation/ClassManage/classInsertForm.do?floor=${floor}'>강의실 생성</a></button>
		</div>
		<div class="footer l-box is-center">열심히 해봅시다!</div>
	</div>
</body>
</html>
