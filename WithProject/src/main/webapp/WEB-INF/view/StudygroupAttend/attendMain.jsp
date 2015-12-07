<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>출쳌! | WITH 스터디</title>
<%@ include file="/WEB-INF/view/include/common_top.jsp"%>
<script>
$(document).ready(function() {
  var modal = $('.modal');
  $( ".btn" ).on( "click", function() {
    $( modal ).toggleClass('modal--show');
    $('body').toggleClass('hidden');
  });

  $( ".overlay" ).on( "click", function() {
    $( modal ).toggleClass('modal--show');
    $('body').toggleClass('hidden');
  });

  $( ".modal__close" ).on( "click", function() {
    $( modal ).toggleClass('modal--show');
    $('body').toggleClass('hidden');
  });  
	

	<c:forEach items="${list}" var="list">
		var html = "";
		html += "<tr class='tr_${list.memberNo}'>"
		html += "<td>${list.memberName}</td>"
		html += "</tr>"
		$(".listTable").append(html);
		trList("${list.memberNo}");					
	</c:forEach>
});

function trList(memberNo) {
  $.ajax({
    url : "${pageContext.request.contextPath}/attend/attendList.json?memberNo="+memberNo+"&groupNo=${groupNo}"
  })
  .done(function(response) {
    $.each(response, function(index, AttendVO) {
	    var html ="";
	    console.log(response);
	    if(response[index].check==true)
	   		html += "<td>O</td>";
	   	else
	   		html += "<td>X</td>";
	   	$(".tr_"+memberNo).append(html);
    })
    
  })
}
</script>
<style>
* {
   -webkit-box-sizing: border-box;
   -moz-box-sizing: border-box;
   box-sizing: border-box;
}

html, body {
   width: 100%;
}

body {
   
/*    padding: 40px; */
}

a {
   color: #D4341A;
   text-decoration: none;
}

.tc {
   text-align: center;
}

.dib {
   display: block;
}

.credit {
   position: fixed;
   bottom: 10px;
   width: 100%;
   left: 0;
}

.btn {
   padding: 15px 20px;
   background: #D4341A;
   color: #FFF;
   font-size: 1rem;
   margin: 2rem 0;
   display: inline-block;
}

.overlay {
   background:rgba(0, 0, 0, .5);
   position:absolute;
   top:0;
   left:0;
   width:100%;
   height:100%;
}
.modal--show .overlay {
	top:-50%;
  left:-50%;
	width:300%;
  height:500%;
  z-index:999;
}

.modal {
   visibility: hidden;
}

.modal__contents {
    background: white;
    width: 26rem;
    position: absolute;
    left: 50%;
    margin-left: -16rem;
    top: 6rem;
    min-height: 20rem;
    z-index: 99999;
}

.modal__contents h1 {
   margin: 0;
   padding: 0;
   line-height: 4rem;
   text-align: center;
   display: block;
}

.modal__close {
   position: absolute;
   right: 2rem;
   top: 2rem;
   text-decoration: none;
   display: none;
}

.modal--show {
   visibility: visible;
}

.modal--transition {
   -webkit-transform: scale(0.7);
   -moz-transform: scale(0.7);
   -ms-transform: scale(0.7);
   transform: scale(0.7);
   opacity: 0;
   -webkit-transition: all 0.3s;
   -moz-transition: all 0.3s;
   transition: all 0.3s;
}

.modal--show .modal--transition {
   -webkit-transform: scale(1);
   -moz-transform: scale(1);
   -ms-transform: scale(1);
   transform: scale(1);
   opacity: 1;
}

@media ( max-width : 48rem) {
   .modal__contents {
      top: 0;
      left: 0;
      bottom: 0;
      width: 100%;
      margin: 0;
   }
   .modal__close {
      display: block;
   }
   .modal--transition {
      -webkit-transform: translateX(-0) translateY(150%);
      -moz-transform: translateX(-0) translateY(150%);
      -ms-transform: translateX(-0) translateY(150%);
      transform: translateX(-0) translateY(150%);
   }
}
body.hidden {
	overflow:hidden;
}
body.hidden header {
	z-index:0;
}
</style>
</head>
<body class="page-sub">
   <%@ include file="/WEB-INF/view/include/common_header.jsp"%>
   <main>
	   <div class="container">
      <h3 class="title">구성원 출석</h3>
			<div class="ExamListDIV">
     <div style="width: 200px;">
        <div class="page-wrapper">
           <div class="modal">
              <div class="overlay"></div>
              <div class="modal__contents modal--transition">
                 <a class="modal__close" href="#">X</a>
                 <h1>출석 QR Code</h1>
                 <div style='    width: 60%;    text-align: center;    margin: 0 auto 0;'>
	                 <img src='${pageContext.request.contextPath}/images/qrcode_${groupNo}.png' alt="qrcode"/>
                 </div>
              </div>
           </div>
           <div class="dib tc">
              <button type="button" class="btn">출석 입력!!</button>
           </div>
        </div>
        <div>
        	<div>
        		<h4>최근 출석일 출석 현황</h4>
        			<table class="listTable">
        			</table>
        	</div>
        </div>
     </div>
  	</div>
			
	   </div>
   </main>
   </body>
</html>