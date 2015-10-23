<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원 정보 수정</title>
	<%@ include file="/WEB-INF/view/include/common.jsp"%>
</head>
<body class="page-modifyForm">
<%@ include file="/WEB-INF/view/include/topBar.jsp"%>
<div class="content-wrapper" style="position:static;">
    <div class="content">
		<div class="mypage">
			<h2>회원 정보 수정</h2>
			<form action="${pageContext.request.contextPath}/login/modify.do" method="post">
				<input type="hidden" name="memberNo" value="${member.memberNo}" />
				<table>
					<colgroup>
						<col style="width:30%" />
						<col style="width:70%" />
					</colgroup>
					<tbody>
						<tr>
							<th>아이디</th>
							<td>
								${member.id}	
								<input type="hidden" name="id"  value="${member.id}" />
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="password" style="width:250px" value="${member.password}" required autofocus /></td>
						</tr>
						<tr>
							<th>회원이름</th>
							<td>
								${member.name}
								<input type="hidden" name="name" value="${member.name}" />
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="text" name="email" style="width:250px;" value="${member.email}" required autofocus /></td>
						</tr>
					</tbody>
				</table>
				<div class="btn-set">
					<input type="submit" class="pure-button pure-button-primary" value="수정하기" />
					<input type="button" onclick="location.href='${pageContext.request.contextPath}/login/mypage.do'" class="pure-button pure-button-primary" value="돌아가기" />
				</div> 
			</form>
		</div>
	</div>
	<script type="text/javascript">footer()</script>
</div>
</body>
</html>
