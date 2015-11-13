<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>일정 | WITH 스터디</title>
<%@ include file="/WEB-INF/view/include/common_top.jsp"%>
<script>
$(document).ready(function() {
	$(".createExam").on('click', function() {
	  location.href='${pageContext.request.contextPath}/main/createExamForm.do';
  });
});
</script>
<title>Insert title here</title>
</head>
<style>
	.content {
		width:1000px;
		margin:0 auto;
		background:#fff;
		min-height:600px;
		margin-top:30px;
		padding:20px 30px;
	}
</style>
<body>
	<%@ include file="/WEB-INF/view/include/common_header.jsp"%>
		<main>
			<div class="content">
				<h1 class="title">최근 시험지</h1>
				<div class="ExamListDIV">
					<input type="button" value="시험 등록" class="createExam" id="createExam"/>
					<table border="1">
						<tr>
							<th>시험 번호</th>
							<th>시험 제목</th>
							<th>시험 일시</th>
						</tr>
						<c:forEach items="${list}" var="list">
							<tr>
								<td>${list.examNo}</td>
								<td><a href="${pageContext.request.contextPath}/exam/examResolve.do?no=${list.examNo}&title=${list.examTitle}&info=${list.examInfo}">${list.examTitle}</a></td>
								<td>${list.examDate}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</main>
</body>
</html>