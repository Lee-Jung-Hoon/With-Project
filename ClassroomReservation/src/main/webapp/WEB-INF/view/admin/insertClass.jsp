<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<title>Insert title here</title>
<script>
	// 강의실 등록
	function registClass_submit() {
		$.ajax({
	 	 type : 'get',
			url : "classReg.json",
			dataType : "json",
			data:$("#classForm").serialize(),
			success : function() {
		 	 alert("강의실이 등록되었습니다.");
	   	 jsClose();
	  	}
	 	});
	}
	  
	function jsClose() {
    parent.$.fn.colorbox.close();
    parent.location.reload();
  }
</script>
</head>
<body>
	<form id="classForm">
		<table>
			<tr>
				<th>강의실 이름</th>
				<td><input type="number" step="1" id="className" name="className" value="${floor}01" required="required">호</td>
			</tr>

			<tr>
				<th>강의실 수용인원</th>
				<td><input type="number" min="1" max="500" value="1" id="classPerson" name="classPerson" required="required">명</td>
				<td><input type="hidden" name="classLeft" value="10" ></td>
				<td><input type="hidden" name="classTop" value="60" ></td>
				<td><input type="hidden" name="floor" value="${floor}" ></td>
			</tr>

			<tr>
				<th>강의실 상세 내용</th>
				<td><textarea cols="50" rows="10" id="classDetail" name="classDetail" required="required"></textarea>
			</tr>
		</table>
		<input type="button" onclick="registClass_submit()" value="글등록">
	</form>
</body>
</html>