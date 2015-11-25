<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>시험 | WITH 스터디</title>
<%@ include file="/WEB-INF/view/include/common_top.jsp"%>
<script>
// 항목 생성 번호
var addCnt = 0;

var cnt = 0;
// 시험 문제 번호
var examCnt = 0;
var HTML = "";
$(document).ready(function() {
	// 제목 마우스 오버
  $("#examTitle").on("mouseover", function () {
    $(this).css("border", "1px solid #ccc");
    $(this).parent().css("background", "#eee");
  });
	
	// 제목 마우스 아웃
	$("#examTitle").on("mouseout", function () {
    $(this).css("border", "1px solid white");
    $(this).parent().css("background", "white");
  });
	
	// 시험 설명 마우스 오버
	$(document).on("mouseover", "div>#examExplain", function () {
    $(this).css("border", "1px solid #ccc");
    $(this).parent().css("background", "#eee");
  });
	
	// 시험 설명 마우스 아웃
	$(document).on("mouseout", "div>#examExplain", function () {
    $(this).css("border", "1px solid white");
    $(this).parent().css("background", "white");
  });
	
	$(document).on("mouseover", "div>#examExplain", function () {
    $(this).css("border", "1px solid #ccc");
    $(this).parent().css("background", "#eee");
  });
	
	// 항목 추가 버튼 클릭시
	$(".addBtn").on('click', function() {
	  var div = "";
	  div += "<div class='addPanel_"+addCnt+"' id='addPanel_"+addCnt+"' style='width: 100%; border: 1px #bbb solid; z-index: 1; background: #fbfbfb;  box-shadow: 5px -5px 5px #bbb; display: none;'>";
			div += "<div class='btnDIV_"+addCnt+"' id='btnDIV_"+addCnt+"' style='text-align: end; margin-right: 10px;'>";
				div += "<button class='btnModify' id='btnModify' style='background:#eee; border: 1px solid #ccc; padding: 5px;  border-radius: 5px;'>";
					div += "<img style=' width: 25px; background: #eee;' alt='' src='${pageContext.request.contextPath}/images/icon_modify.png'/>";
				div += "</button>";
			
				div += "<button class='btnDelete' id='btnDelete' style='background:#eee; border: 1px solid #ccc; padding: 5px;  border-radius: 5px;'>";
					div += "<img style=' width: 25px; background: #eee;' alt='' src='${pageContext.request.contextPath}/images/icon_delete.png'/>";
				div += "</button>";
			div += "</div>";
			
			div += "<table style='width:90%;'>";
				div += "<tr>";
					div += "<th style='width:20%; text-align: left; padding-left: 30px;'>시험 문제</th>";
					div += "<td><input class='exampleTitle_"+addCnt+"' name='exampleTitle_"+addCnt+"' style='width: 80%; font-size: 18px; height: 35px;' type='text' placeHolder=' 시험 문제 내용 입력'></td>";
				div += "</tr>";
				div += "<tr>";
					div += "<th style='width:20%; text-align: left; padding-left: 30px;'>문제 유형</th>";
					div += "<td>";
						div += "<select onchange='examOption("+addCnt+");' id='examOption_"+addCnt+"' class='examOption_"+addCnt+"' name='examOption_"+addCnt+"'>";
							div += "<option value='1'>객관식</option>";
							div += "<option value='2'>주관식</option>";
						div += "</select>";
						
						div += "<div style='padding-top: 20px;' id='examOptionDIV_"+addCnt+"' class='examOptionDIV_"+addCnt+"'>";
							div += "<div>";
								div += "<input style='margin-right: 10px;' type='checkbox' id='answer_"+addCnt+"_0'>";
								div += "<input type='text' id='example_"+addCnt+"_0' value='옵션'>";
							div += "</div>";
						div += "</div>";
						
						div += "<div style='padding-top: 20px; display: block;' id='exampleAdd_"+addCnt+"' class='exampleAdd_"+addCnt+"'>";
							div += "<input type='hidden' class='exampleCnt_"+addCnt+"' id='exampleCnt_"+addCnt+"' value='0'>";
							div += "<input type='button' onclick='addExample("+addCnt+")' value='보기 추가'>";
						div += "</div>";
					div += "</td>";
				div += "</tr>";
			
				div += "<tr>";
					div += "<td style='padding-bottom:20px; padding-left: 30px;'>";
						div += "<button onclick='completeExample("+addCnt+")' style='background:#eee;border: 1px solid #ccc; padding: 5px;  border-radius: 5px;'>";
							div += "<img style=' width: 25px; background: #eee;' alt='' src='${pageContext.request.contextPath}/images/icon_complete.png'/> 작성완료";
						div += "</button>";
					div += "</td>";
				div += "</tr>";
			div += "</table>";
		div += "</div>";
		$(".examList").append(div);
    $('.addPanel_'+addCnt).slideDown("slow");
    addCnt++;
  });
	
	$(".submitBtn").on('click', function () {
	  var exampleTitle = "";
	  var example_answer = "";
    for(var i=0; i<addCnt; i++) {
      exampleTitle += $(".exampleTitle_"+i).val();
      for(var j=0; j<=$(".exampleCnt_"+i).val(); j++) {
      	if(j==$(".exampleCnt_"+i).val())
      	  example_answer += $("#example_"+i+"_"+j).val()+":"+$("#answer_"+i+"_"+j).is(":checked");
        else 
          example_answer += $("#example_"+i+"_"+j).val()+":"+ $("#answer_"+i+"_"+j).is(":checked") + "-";
      }
      if(i==addCnt-1) {
        example_answer += "";
        exampleTitle += "";
      }
      else {
        example_answer += ",";
        exampleTitle += ",";
      }
    }
		location.href='/WithProject/exam/createExam.do?examTitle='+$("#examTitle").val()+'&examExplain='+$("#examExplain").val()+'&exampleTitle='+exampleTitle+"&example_answer="+example_answer;
  });
});

// 보기 추가 클릭시 실행
function addExample(no) {
  cnt++;
  $(".exampleCnt_"+no).val(cnt);
	HTML = "";	  
  HTML += "<div style='margin-top:10px;'><input type='checkbox' style='margin-right: 10px;' id='answer_"+no+"_"+cnt+"'>";
  HTML += "<input type='text' id='example_"+no+"_"+cnt+"' value='옵션'></div>";
  $("#examOptionDIV_"+no).append(HTML);
}

// 문제 유형 항목을 변경할 경우 실행
function examOption(no) {
  HTML = "";
  if($("#examOption_"+no).val()=="1") {
    cnt = 0;
    $("#examOptionDIV_"+no).empty();
   	HTML += "<div><input style='margin-right: 10px;' type='checkbox' id='answer_"+cnt+"'>";
    HTML += "<input type='text' id='example_"+cnt+"' value='옵션'></div>";
    $("#examOptionDIV_"+no).append(HTML);
    $(".exampleAdd_"+no).css("display", "block");
  }
  else if($("#examOption_"+no).val()=="2") {
    $("#examOptionDIV_"+no).empty();
    $(".exampleAdd_"+no).css("display", "none");
  }
}

function completeExample(no) {
  $(".examCnt_"+no).remove();
  cnt = 0;
  var exampleTitle = $(".exampleTitle_"+no).val();
  var exampleCnt = $(".exampleCnt_"+no).val();
  var examOption = $("#examOption_"+no).val();
  
  $(".addPanel_"+no).slideUp("slow");
  HTML = "";
  HTML += "<div class='examCnt_"+no+"'style='padding: 10px; margin-left: 45px; margin-bottom: 20px; font-weight: bold;'>";
  HTML += exampleTitle+"<br/>";
  for(var i=0; i<=exampleCnt; i++) {
    if($("#answer_"+no+"_"+i).val()!=null) {
      if($("#answer_"+no+"_"+i).is(":checked"))  {	
        HTML += "<input type='checkbox' checked='checked' class='answer_" +i+ "' name='answer_"+i+"'>"
      }
      else {
    		HTML += "<input type='checkbox' class='answer_" +i+ "' name='answer_"+i+"'>"
      }
    	HTML += "<input type='text' style='border-style:none;' id='example_"+i+"' value='"+$("#example_"+no+"_"+i).val()+"'><br/>"
    }
  }
  HTML += "<input type='button' value='수정' onclick='modifyExam("+no+")')></div>";
  $("#examList").append(HTML);
  examCnt++;
}

function modifyExam(no) {
  $(".addPanel_"+no).slideDown("slow");
}

</script>
</head>
<body class="page-sub">
	<%@ include file="/WEB-INF/view/include/common_header.jsp"%>
	<main>
		<div class="container">
			<h1 style="height:50px; width: 60%; margin: 0 auto 0; margin-top: 50px; font-size: 20px;	font-weight: bold;">시험 개설</h1>
		<div style="width: 60%; border: 1px #ccc solid; margin: 0 auto 0; background: white; margin-bottom: 50px;">
				<div style="background: white; width: 100%; text-align: center; padding-bottom: 10px; padding-top: 10px;">
				<input type="text" id="examTitle" name="examTitle" value="시험-제목없음" 
					style="font-size:30px; box-sizing: border-box; font-weight:bold; width:90%; border:1px solid white;;"/>
			</div>
			<div style="background: white; width: 100%; text-align: center; padding-bottom: 10px; padding-top: 10px;">
				<input type="text" id="examExplain" name="examExplain" placeholder="시험지 설명" 
					style="box-sizing:border-box; font-size:15px; font-weight:bold; width:90%; border:1px solid white;"/>
			</div>
			
			<div class="examList" id="examList">
			</div>
			<div style="background: white; width: 100%; padding-left: 40px;  padding-bottom: 10px; padding-top: 10px;">
<!-- 				<a href='#' class="addBtn" id="addBtn" style="padding: 5px;">항목 추가</a> -->
				<input type="button" class="addBtn" id="addBtn" value="항목 추가" style="padding: 5px;">
				<input type="button" class="submitBtn" id="submitBtn" value="시험 저장" style="padding: 5px;">
			</div>
		</div>
		</div>
	</main>
</body>
</html>