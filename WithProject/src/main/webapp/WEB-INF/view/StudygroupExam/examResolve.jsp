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
	  var locationNum = location.href.split("groupNo=")[1];
	  $('.btn-return').attr('href','${pageContext.request.contextPath}/exam/examList.do?groupNo='+locationNum);
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
		  HTML += "<div class='exam-test'>";
		  HTML += "<p class='exam-title'>"+(i+1)+". "+list[i]+"</p>";
		  HTML += "<ul>"
		  var array = item[i].split(",");
		  for(var j=0; j<array.length; j++) {
		    var correct = array[j].split(":");
		    if(correct[0]!="undefined") {
		    
		    HTML += "<li class='exam_"+i+"_"+j+"'>";
		    HTML +=	"<input id='answer_"+i+"_"+j+"' class='answer_"+i+"_"+j+"' type='checkbox'>";
		    HTML += "<label for='answer_"+i+"_"+j+"'>"+correct[0]+"</label>";
		    HTML += "<input class='correct_"+i+"_"+j+"' type='hidden' value='"+correct[1]+"'>";
		    HTML += "</li>";
		    
		    if(correct[1] == "true")
		      result.push('answer_'+i+"_"+j);
		  	}
		    
		  }
		  HTML += "<ul>"
		  HTML += "</div>";
		}

		$(".ExamDIV").append(HTML);
		
		
		$("#sendExample").on('click',function(){
		  for(var j=0; j<result.length; j++){
		 		if($("."+result[j]).is(":checked")){
		 	  	cnt++;
		 		}
		  }
		 //console.log("채점표 : "+ cnt+"/"+result.length)
		 
	   var examScore = Math.round(100/result.length)*cnt;
	   var examTotalNo = result.length;
	   var examChkNo = cnt;
	   var HTML = "<div id='examResult' class='examResult'>";
		  HTML += "<p>채점표 : "+ cnt+"/"+result.length+"</p>";
		  HTML += "<p class='score'>점수 : <span>"+Math.round((100/result.length)*cnt)+"</span>점</p>";
		  HTML += "</div>";
	   
	   $(".ExamDIV").append(HTML);
	  
// 		HTML += "<input type='hidden' name='examScore' value='"+examScore+"'></div>";
// 		HTML += "<input type='hidden' name='examTotalNo' value='"+examTotalNo+"'></div>";
// 		HTML += "<input type='hidden' name='examChkNo' value='"+examChkNo+"'></div>";
// 	  cnt=0;
// 		$(".ExamDIV").append(HTML);
	
		})
	
		
  });
	
</script>
<style>
.examResult {
	position:absolute;
	bottom:0;
	right:20px;
	padding:10px 20px 10px;
}
.examResult p {
	font-size:18px;
	line-height:24px;
	font-weight:bold;
}
.examResult .score {
	font-size:23px;
	padding:5px 0;
}
.examResult .score span {
	color:#E94B3B;
}
.btn-return {
	background:#E94B3B;
	width:100px;
  height:50px;
  display:inline-block;
  position:absolute;
  bottom:10px;
  left:130px;
  text-align:center;
  line-height:50px;
}
</style>
</head>
<body class="page-sub">
	<%@ include file="/WEB-INF/view/include/common_header.jsp"%>
	<main>
		<div class="container">
			<h3>시험 제출</h3>
				<div class="ExamDIV">
					<h4>${title}</h4>
					<p>${info}</p>
					<input type="hidden" name="examNo" value="${examNo}" />
					<button type='button' class="btnSubmit commonBtn sendExample" id='sendExample'>시험지 제출</button>
					<a href="#" class="commonBtn btn-return">돌아가기</a>
				</div>
		</div>
	</main>
</body>
</html>