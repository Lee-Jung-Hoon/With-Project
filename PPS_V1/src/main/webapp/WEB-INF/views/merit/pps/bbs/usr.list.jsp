<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>Home</title>
</head>
<h1>Board List</h1>
<table border="1">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>등록일</th>
			<th>추천수</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="item" items="${list}">
			<tr>
				<td>${item.itemId}</td>
				<td>${item.title}</td>
				<td>${item.rgstDate}</td>
				<td>${item.rcmdCnt}</td>
				<td>${item.readCnt}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>