<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>마이페이지</title>
	<%@ include file="/WEB-INF/view/include/common.jsp"%>
</head>
<body class="page-mypage">
<%@ include file="/WEB-INF/view/include/topBar.jsp"%>
<div class="content-wrapper" style="position:static;">
	<div class="content">
		<div class="mypage">
			<h2>마이페이지</h2>
			<a href="${pageContext.request.contextPath}/login/modifyForm.do" class="pure-button btn-modify">회원정보 수정</a>
			<table>
				<colgroup>
					<col style="width:30%" />
					<col style="width:70%" />
				</colgroup>
				<tbody>
					<tr>
						<th>아이디</th>
						<td>${member.id}</td>
					</tr>
					<tr>
						<th>회원이름</th>
						<td>${member.name}</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${member.email}</td>
					</tr>
				</tbody>
			</table> 
			<input style="margin:10px 0 0 10px;" type="button" onclick="location.href='${pageContext.request.contextPath}/login/reserve.do?memberNo=${member.memberNo}'" class="pure-button pure-button-primary" value="예약 이력 보기" />
		</div>
	</div>
	<script type="text/javascript">footer()</script>
</div>
</body>
</html>