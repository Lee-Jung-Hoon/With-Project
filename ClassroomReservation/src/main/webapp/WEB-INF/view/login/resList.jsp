<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>예약내역</title>
	<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
  <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/grids-responsive-min.css">
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layouts/marketing.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/spanner.css">
	<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/common.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
		  	$(".btn-cancel").on("click", function(){
		  	  var resCheck = confirm("해당 예약을 취소 하시겠습니까?");
		  	  
		  	  if (resCheck == true) {
		  	    
		  	    var resNo = $(this).find("input").val();
			  	  var id = $(this).parent().attr("id");
			  	  $.ajax({
			  	    type : "GET",
			  	    url : "${pageContext.request.contextPath}/login/resCancel.json",
			  	    datatype : "JSON",
			  	    data : {resNo:resNo}
			  	  })
			  	  .done(function(data){
			  	    $("#"+id).text("X");
			  	  })
			  	  .fail(function(){
			  	    alert("실패");
			  	  });
			  	  
		  	  } else {
		  	    
		  	    return false;
		  	  }

		  	});	  
		});
	</script>
	<style>
		.btn-cancel {
			background:none;
			border:0;
		}
	</style>
</head>
<body class="page-reservation">
<%@ include file="/WEB-INF/view/include/topBar.jsp"%>
<div class="content-wrapper" style="position:static; margin-top:62px;">
    <div class="content">
		<div class="mypage">
			<h2>나의 예약내역</h2>
			<a href="${pageContext.request.contextPath}/login/mypage.do" class="pure-button btn-modify">되돌아가기</a>
			<table>
				<colgroup>
					<col style="width:5%" />
					<col style="width:12.5%" />
					<col style="width:12.5%" />
					<col style="width:15%" />
					<col style="width:20%" />
					<col style="width:20%" />
					<col style="width:20%" />
					<col style="width:10%" />
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>예약날짜</th>
						<th>이용날짜</th>
						<th>강의실 번호</th>
						<th>사용시간</th>
						<th>이용목적</th>
						<th>예약상태</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${empty res}">
						<tr>
							<td colspan="7">신청 내역이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="res" items="${res}" varStatus="loop">
							<tr>
								<td>${loop.count}</td>
								<td>${res.regDate}</td>
								<td>${res.rsvDay}</td>
								<td>${res.classNo}호</td>
								<td>${res.startTime}:00 ~ ${res.startTime + res.usingTime}:00</td>
								<td>${res.resFor}</td>
								<c:if test="${res.status eq 1}">
									<td id="res_${loop.count}"><button type="button" class="btn-cancel"><input type="hidden" value="${res.resNo}" />O</button></td>
								</c:if>
								<c:if test="${res.status eq 0}">
									<td>X</td>
								</c:if>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table> 
		</div>
	</div>
	<script type="text/javascript">footer()</script>
</div>
</body>
</html>