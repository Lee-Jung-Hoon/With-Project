<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>강의실 이름</th>
			<td><input type="text" id="name"></td>
		</tr>
		
		<tr>
			<th>강의실 번호</th>
			<td><input type="text" id="classCode"></td>
		</tr>
		
		<tr>
			<th>강의실 수용인원</th>
			<td><input type="text" id="classPerson"></td>
		</tr>
		
		<tr>
			<th>강의실 상세 내용</th>
			<td>
				<textarea cols="50" rows="10" id="classDetail"></textarea>
			</td>
		</tr>
	</table>
</body>
</html>