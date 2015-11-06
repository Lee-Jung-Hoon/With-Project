<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/plugin/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="assets/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript">
	var oEditors = [];
	$(document).ready(function() {
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "detail", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "${pageContext.request.contextPath}/plugin/SE2/SmartEditor2Skin.html",  
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
                   
              }
          }, 
          fOnAppLoad : function(){
              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
              oEditors.getById["detail"].exec("PASTE_HTML", [""]);
          },
          fCreator: "createSEditor2"
      });
      
      //저장버튼 클릭시 form 전송
//       $("#save").click(function(){
//           oEditors.getById["detail"].exec("UPDATE_CONTENTS_FIELD", []);
//           $("#WriteForm").submit();
//       });    
	});
</script>
	<style>
		.content {
			width: 100%;
			height: 1200px;
		}
		.content .title {
			width: 80%;
    	margin: 0 auto 0;
   	 	margin-top: 50px;
   		height: 50px;
   		font-size: 20px;
    	font-weight: bold;
		}
		.content .firstStep{
			width: 80%;
			height:1000px;
			margin: 0 auto 0;
	    border: 1px gray solid;
 	   	border-radius: 7px;
   	 	background-color: white;
		}
		.content .input {
			width: 90%;
    	margin: 0 auto 0;
    	border: 1px gray solid;
    	padding-left: 9px;
    	padding-top: 15px;
    	padding-bottom: 35px;
    	border-top-style: none;
    	border-left-style: none;
    	border-right-style: none;
		}
		
		.content .titleImage {
			height: 130px;
    	width: 13%;
   		border: 1px solid black;
		}
		.content h2 {
		  color: #4195f5;
			margin-bottom: 10px;
		}
	</style>
</head>
<body>
	<header>
		<div class="login-area">
			<div class="login">
				<form action="#" method="post">
					<dl class="list maki">
						<dt><a href="#" class="toggle">로그인</a></dt>
						<dd class="fb-login"><em><a href="">페이스 북 로그인</a></em></dd>
						<dd class="input-login"><em><input type="text" id="id" placeholder="ID" /></em></dd>
						<dd class="input-login"><em><input type="password" id="pw" placeholder="password" /></em></dd>
						<dd class="btn-login"><em><input type="submit" value="로그인"  /></em></dd>
					</dl>
				</form>
			</div>
		</div>
	</header>
	<main>
		<div class="content">
			<h1 class="title">개설하기</h1>
			<div class="firstStep">
				<div class="input">
					<h2>스터디 기본 정보 입력</h2>
				</div>
				
				<div class="input">
					<h2>제목 입력</h2>
					<input style="height: 30px;" type="text" size="120px" name="title" id="title">
				</div>
				
				<div class="input">
					<h2>대표이미지</h2>
				</div>
				
				<div class="input">
					<h2>상세내용 입력</h2>         
					<textarea rows="10" cols="40" id="detail" name="detail" style="width:850px; height:350px; "></textarea>
				</div>
			</div>
		</div>
	</main>
</body>
</html>