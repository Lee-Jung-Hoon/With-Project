<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>레이아웃</title>
</head>
<body>
	<%@ include file="/WEB-INF/view/include/topBar.jsp"%>
	<div class="content-wrapper"
		style="position: static; margin-top: 40px;">
		<div class="content"
			style="height: 600px; width: 90%; margin: 0 auto; border: 1px solid black; margin-bottom: 40px;">
			<h2>강의실 등록</h2>
			<form class="form-horizontal" id="classForm" role="form">
				<div class="form-group">
					<label class="control-label col-sm-2" for="email">강의실 이름:</label>
					<div class="col-sm-10">
						<input type="number" step="1" id="className" name="className"
							class="form-control" value="${floor}01" required="required"
							class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="pwd">수용 인원:</label>
					<div class="col-sm-10">
						<input type="hidden" name="classLeft" value="10"> <input
							type="hidden" name="classTop" value="60"> <input
							type="hidden" name="floor" value="${floor}"> <input
							type="number" min="1" max="500" value="1" id="classPerson"
							class="form-control" name="classPerson" required="required">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="email">상세 내용:</label>
					<div class="col-sm-10">
						<textarea cols="50" rows="10" id="classDetail"
							class="form-control" name="classDetail" required="required"></textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="button" onclick="registClass_submit()"
							class="btn btn-default" value="글등록">
					</div>
				</div>
			</form>
		</div>
		<%@ include file="/WEB-INF/view/include/bottom.jsp"%>
	</div>
</body>
</html>
