<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>레이아웃</title>
<link rel="stylesheet"
	href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
<link rel="stylesheet"
	href="http://yui.yahooapis.com/pure/0.6.0/grids-responsive-min.css">
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/layouts/marketing.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/spanner.css">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<script>
$(document).ready(function(){
  function changeDate() {
    $.ajax({
      url:"${pageContext.request.contextPath}/reservation/searchReservation.json",
      type:"POST",
			 datatype:"JSON",
			 data:rsv_day
    })
    .done(function () {
      
    });
  }
});
</script>
</head>
<body>
	<%@ include file="/WEB-INF/view/include/topBar.jsp"%>

	<div class="content-wrapper"
		style="position: static; margin-top: 62px;">
	<div class="content"
			style="height: 600px; width: 90%; margin: 0 auto; border: 1px solid black; margin-bottom: 40px;">	
			<h1>회원 예약 내역</h1>
				<br/>
				<div style="height: 85%; border: 1px solid gray;">
					<br/>
					<input type="date" id="rsvDay" name="rsvDay" min="2015-01-01" max="2015-12-31" onchange="changeDate();" />
					<select >
					</select>
						<table border="1">
							<tr>
								<th>삭제</th>
								<th>예약번호</th>
								<th>회원아이디</th>
								<th>강의실 번호</th>
								<th>예약일자</th>
								<th>시작시간</th>
								<th>사용시간</th>
								<th>예약목적</th>
								<th>상태</th>
							</tr>
							<tbody class=""></tbody>
						</table>
				</div>
	</div>
		<%@ include file="/WEB-INF/view/include/bottom.jsp" %>		
	</div>
</body>
</html>