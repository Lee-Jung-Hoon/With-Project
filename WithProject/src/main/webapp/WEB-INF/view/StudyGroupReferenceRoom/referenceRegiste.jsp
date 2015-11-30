<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>일정 | WITH 스터디</title>
<%@ include file="/WEB-INF/view/include/common_top.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/plugin/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script>
$(document).ready(function() {

  var selectMenu = $("#referenceCategori option:selected").val();
  $("#categori").val(selectMenu);

  var oEditors = [];
  var UserAgentKind_oEditor_Mode="HTMLSrc"; 
  
	setTimeout(function(){
	  nhn.husky.EZCreator
	  .createInIFrame({
	   oAppRef : oEditors,
	   elPlaceHolder : "referenceDetail", //textarea에서 지정한 id와 일치해야 합니다. 
	   //SmartEditor2Skin.html 파일이 존재하는 경로
	   sSkinURI : "/WithProject/plugin/SE2/SmartEditor2Skin.html",
// 	   htParams : {
// 	     // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
// 	     bUseToolbar : true,
// 	     // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
// 	     bUseVerticalResizer : true,
// 	     // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
// 	     bUseModeChanger : true,
// 	     fOnBeforeUnload : function() {
// 	     },
// 	     SE_EditingAreaManager : { 
//          sDefaultEditingMode : mode 
// 				}
// 	   },
// 	   fOnAppLoad : function() {
// 	     //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
// 	     oEditors.getById["referenceDetail"].exec("PASTE_HTML", [ "" ]);
// 	   },
// 	   fCreator : "createSEditor2"
// 	  });
	   		htParams : {
	   		  bUseToolbar : true, 
       		fOnBeforeUnload : function(){ 
        	},
        	SE_EditingAreaManager : {	
        	  	sDefaultEditingMode : UserAgentKind_oEditor_Mode
        	} 
          // - Editor 모드 : WYSIWYG - HTML 모드 : HTMLSrc - TEXT 모드 : TEXT 
				}, 
				fOnAppLoad : function(){ 
       	// oEditors.getById["referenceDetail"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]); 
				}, 
				fCreator: "createSEditor2" 
		}); 
	 	},1000);

	$("#file").on('change', function() {
	  var formData = new FormData();
	  formData.append("file", $("#file").get(0).files[0]);
    $.ajax({
      url : "/WithProject/referenceRoom/convertFile.json",
      data : formData,
      type: "post",
      processData: false,
      contentType: false
    })
    .done(function (response) {
      
      oEditors.getById["referenceDetail"].exec("PASTE_HTML", [response]);
    })
  });
	
	$("#referenceCategori").on("change", function() {
	  var selectMenu = $("#referenceCategori option:selected").val();
	  console.log("categoriMenu : " + selectMenu);
	  $("#categori").val(selectMenu);
	})
	
	
	$("#submitBtn").on("click", function () {
    oEditors.getById["referenceDetail"].exec("UPDATE_CONTENTS_FIELD", []);
    $("#referenceForm").submit();
	});
});
</script>
</head>
<body class="page-sub">
	<%@ include file="/WEB-INF/view/include/common_header.jsp"%>
	<main>
	<form action="/WithProject/referenceRoom/referenceRegiste.do" id="referenceForm"  method="post" enctype="multipart/form-data">
		<div class="container">
			<h3 class="title">자료등록실</h3>
				<div class="referenceRegiste">
					<table class="registeForm">
							<colgroup>
								<col style="width:20%" />
								<col style="width:70%" />
								<col style="width:10%" />
							</colgroup>
							<tbody>
								<tr>
									<th>제목</th>
									<td class="td-common" colspan="2"><input type="text" class="registeTitle" name="referenceTitle" id="registeTitle" /></td>
								</tr>
								<tr>
									<th>분류 설정</th>
									<td class="td-common" colspan="2">
										<input type="text" class="categori" name="referenceCategori" id="categori" />
										<select id="referenceCategori">
												<option>이미지 & 그래픽</option>
												<option>문서 / 사무</option>
												<option>동영상</option>
												<option>기타</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>파일첨부</th>
										<td class="td-common"><input type="file" name="file" id="file" class="registeSpace" accept=".doc"></input></td> 
										<td><button id="referenceBtn" class="referenceBtn commonBtn">파일등록</button></td>
								</tr>
								<tr>
									<td colspan="3">
										<div class="referenceDetail">파일내용</div>
										<textarea rows="10" cols="40" id="referenceDetail" name="referenceFile"   style="width:100%; height:450px; margin:0 auto;"></textarea>
									</td>
								</tr>
							</tbody>
					</table>
						<div class="btn-set">
							<button type="button" class="submitBtn commonBtn" id="submitBtn">등록</button>
							<button type="button" class="cancelBtn commonBtn" id="cancleBtn" >취소</button>
						</div>
					</div>
				</div>
			</form>
		</main>
</body>
</html>