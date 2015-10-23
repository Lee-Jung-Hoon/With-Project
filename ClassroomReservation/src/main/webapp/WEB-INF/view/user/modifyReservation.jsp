<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>예약내용수정</title>
	<%@ include file="/WEB-INF/view/include/common.jsp"%>
	<script>
	  function modifyReservation() {
	    $.ajax({
	      url : "/ClassroomReservation/reservation/reservationCheck.json",
	      type : "POST",
	      datatype : "JSON",
	      data : $("#rsvForm").serialize()
	    }).done(
	        function(msg) {
	          if (msg == "false") {
	            $.ajax({
	              url : "/ClassroomReservation/reservation/updateReservation.json",
	              type : "POST",
	              datatype : "JSON",
	              data : $("#rsvForm").serialize()
	            }).done(
	                function() {
	              			alert("수정 성공");
	             	   	 jsClose();
	                });
	          } else {
	            alert("같은 시간에 예약 내역이 존재하거나 이미 지난 시간입니다.");
	     	   	 jsClose();
	          }
	        })
	
	  };
		function jsClose() {
	    parent.$.fn.colorbox.close();
	    parent.location.reload();
	  }
	</script>
</head>
<body>
	<form class="form-horizontal" id="rsvForm" >
	<div class="container">
	<h1>예약 내용 수정</h1>
	<br/>
  <div class="form-group">
	예약일자 <input type="date" id="rsvDay" name="rsvDay" min="2015-01-01" 
		max="2015-12-31" value="${resv.rsvDay}" />
		<input type="hidden" name="resNo" value="${resv.resNo}"/>
		</div>
	<div class="form-group">
	시작시간
	<select id="startTime" name="startTime">
		<option value="08">08:00</option>
		<option value="09">09:00</option>
		<option value="10">10:00</option>
		<option value="11">11:00</option>
		<option value="12">12:00</option>
		<option value="13">13:00</option>
		<option value="14">14:00</option>
		<option value="15">15:00</option>
		<option value="16">16:00</option>
		<option value="17">17:00</option>
		<option value="18">18:00</option>
		<option value="19">19:00</option>
		<option value="20">20:00</option>
		<option value="21">21:00</option>
	</select> 시
	</div>
	<div class="form-group" style="margin-bottom: 30px">
		사용시간 <select id="usingTime" name="usingTime">
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
		</select> 시간
	</div>

	<div class="form-group" style="margin-bottom: 30px">
		예약목적 <input type="text" id="resFor" name="resFor" style="width: 400px"
			placeholder="예약 목적을 적어주세요." value="${resv.resFor}" />
	</div>
	</div>
</form>
<div align="right">
<input align="right" onclick="modifyReservation();" type="button" value="수정">
</div>
</body>
</html>