<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>시험제출 | 시험 | WITH 스터디</title>
<%@ include file="/WEB-INF/view/include/common_top.jsp"%>
<script>
	$(document).ready(function () {
  	var list = new Array(); 
  	var item = new Array(); 
  	var HTML = "";
  	var result = [];
  	var cnt = 0;
  	<c:forEach items="${list}" var="list">
  		list.push("${list.exampleTitle}");
  	</c:forEach>
  	<c:forEach items="${item}" var="item">
  		item.push("${item}");
		</c:forEach>
		
		for(var i=0; i<list.length; i++) {
		  HTML += "<div style=' padding-left: 20px;'>"+(i+1)+". "+list[i]+"</div>";
		  var array = item[i].split(",");
		  for(var j=0; j<array.length; j++) {
		    var correct = array[j].split(":");
		    if(correct[0]!="undefined") {
		    HTML += "<div class='exam_"+i+"_"+j+"' style=' padding-left: 40px;'>"
		    HTML += "<input class='answer_"+i+"_"+j+"' type='checkbox'>"+correct[0]+"</div>";
		    HTML += "<input class='correct_"+i+"_"+j+"' type='hidden' value='"+correct[1]+"'></div>";
		    if(correct[1] == "true")
		      result.push('answer_'+i+"_"+j);
		  }
		  }
		  
		  HTML += "<br/>";
		}

		$(".ExamDIV").append(HTML);
		
		
		$("#sendExample").on('click',function(){
		  HTML = "";
		  for(var j=0; j<result.length; j++){
		 		if($("."+result[j]).is(":checked")){
		 	  	cnt++;
		 		}
		  }
		 console.log("채점표 : "+ cnt+"/"+result.length)
		 
	   var examScore = Math.round(100/result.length)*cnt;
	   var examTotalNo = result.length;
	   var examChkNo = cnt;
	  
		HTML += "<input type='hidden' name='examScore' value='"+examScore+"'></div>";
		HTML += "<input type='hidden' name='examTotalNo' value='"+examTotalNo+"'></div>";
		HTML += "<input type='hidden' name='examChkNo' value='"+examChkNo+"'></div>";
	  cnt=0;
		$(".ExamDIV").append(HTML);
	
		})
	
		
  });
	
</script>
</head>
<body class="page-sub">
	<%@ include file="/WEB-INF/view/include/common_header.jsp"%>
	<main>
		<div class="container">
			<h3>시험 제출</h3>
			<form action="${pageContext.request.contextPath}/exam/examResult.do" method="POST">
				<div class="ExamDIV" style="border: 1px #ccc solid; margin:0 auto;">
					<div style="font-size: 30px; font-weight: bold; padding-top: 20px; padding-left: 20px;">${title}</div>
					<div style="font-size: 20px; padding-top: 20px; padding-left: 20px;">${info}</div>
					<input type="hidden" name="examNo" value="${examNo}" />
					<input style='margin-left:20px; margin-bottom:20px;' type='submit' value='시험지 제출' class='sendExample' id='sendExample'>
				</div>
			</form>
		</div>
	</main>
</body>
</html>