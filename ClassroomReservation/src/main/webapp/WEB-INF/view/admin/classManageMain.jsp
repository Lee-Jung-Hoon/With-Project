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
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet"
	href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
<link rel="stylesheet"
	href="http://yui.yahooapis.com/pure/0.6.0/grids-responsive-min.css">
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/layouts/marketing.css">
<script src="${pageContext.request.contextPath}/js/jquery.colorbox.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/colorbox.css" />
<style>
.content>div {
	width: 150px;
	height: 150px;
	padding: 1em;
	background: white;
	position: fixed;
}
</style>
<script>  
  var cnt = 0;
  $(document).ready(
      function() {
        
        $(".insertClass").colorbox({
          iframe : true,
          title : "강의실 등록",
          width : "60%",
          height : "60%"
        });
        
      	function jsClose() {
      		parent.$.fn.colorbox.close();
      		parent.location.reload();
      	}
        
        
        // 강의실 생성 버튼 관련 수행
        $('.btn-class').on(
            'click',
            function() {
              $("<div class='class_"+cnt+"'>강의실</div>").appendTo('.content')
                  .draggable();
              saveEvent(cnt);
              cnt = cnt + 1;
            });

        // 강의실 정보 저장을 위한 이벤트 수행
        function saveEvent(no) {
          $('.class_' + no).on(
              "mouseup",
              function() {
                alert("left : " + $(".class_" + no).css('left') + " - top : "
                    + $(".class_" + no).css('top') + "저장해야할 값");
              });
        }
      });
</script>

</head>
<body>
	<div class="header">
		<div class="home-menu pure-menu pure-menu-horizontal pure-menu-fixed">
			<a class="pure-menu-heading" href="">Your Site</a>
			<ul class="pure-menu-list">
				<li class="pure-menu-item pure-menu-selected"><a href="#"
					class="pure-menu-link">Home</a></li>
				<li class="pure-menu-item"><a href="#" class="pure-menu-link">Tour</a></li>
				<li class="pure-menu-item"><a href="#" class="pure-menu-link">Sign
						Up</a></li>
			</ul>
		</div>
	</div>
	<div class="content-wrapper"
		style="position: static; margin-top: 62px;">
		<h1>강의실 관리 메뉴</h1>
		<div class="content"
			style="background: black; height: 600px; border: 1px solid black;">
			<button type="button" class="btn-class">강의실 생성</button>
			<a class="insertClass"
				href='/ClassroomReservation/ClassManage/redirectClassInset.do'>강의실 생성</a>
		</div>
		<div class="footer l-box is-center">열심히 해봅시다!</div>
	</div>
</body>
</html>
