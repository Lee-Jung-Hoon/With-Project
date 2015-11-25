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
</head>
<body class="page-sub">
	<%@ include file="/WEB-INF/view/include/common_header.jsp"%>
		<main>
			<div class="container">
				<h3 class="title">최근 시험지</h3>
				<div class="ExamListDIV">
					<input type="button" value="시험 등록" class="createExam btn-common" id="createExam"/>
					<table class="table-common">
						<colgroup>
							<col style="width:15%" />
							<col style="width:65%" />
							<col style="width:20%" />
						</colgroup>
						<thead>
							<tr>
								<th><div class="th-border">시험 번호</div></th>
								<th><div class="th-border">시험 제목</div></th>
								<th><div class="th-border">시험 일시</div></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="list">
								<tr>
									<th><div class="th-border">${list.examNo}</div></th>
									<td><div class="link-wrap" style="width:540px;"><a href="${pageContext.request.contextPath}/exam/examResolve.do?no=${list.examNo}&title=${list.examTitle}&info=${list.examInfo}">${list.examTitle}</a></div></td>
									<td>${list.examDate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</main>
</body>
</html>