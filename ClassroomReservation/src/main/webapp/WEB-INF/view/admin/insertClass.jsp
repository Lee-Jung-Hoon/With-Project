<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>강의실 등록</title>
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/common.js"></script>
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
	<div class="container">
  <h2>강의실 등록</h2>
  <form class="form-horizontal" id="classForm" role="form">
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">강의실 이름:</label>
      <div class="col-sm-10">
        <input type="number" step="1" id="className" name="className" class="form-control" value="${floor}01" required="required" class="form-control">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">수용 인원:</label>
      <div class="col-sm-10">          
     		<input type="hidden" name="classLeft" value="12" >
				<input type="hidden" name="classTop" value="150" >
				<input type="hidden" name="floor" value="${floor}" >
        <input type="number" min="1" max="500" value="1" id="classPerson"  class="form-control" name="classPerson" required="required">
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2" for="email">상세 내용:</label>
      <div class="col-sm-10">
        <textarea cols="50" rows="10" id="classDetail"  class="form-control" name="classDetail" required="required"></textarea>
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
				<input type="button" onclick="registClass_submit()" class="btn btn-default" value="글등록">
      </div>
    </div>
  </form>
  <script type="text/javascript">footer()</script>
</div>
</body>
</html>