<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>자료실 | WITH 스터디</title>
<%@ include file="/WEB-INF/view/include/common_top.jsp"%>

<script>
	/* 	function MainList() {
		  $.getJSON("/WithProject/referenceRoom/referenceList.json", {}, function() {
		    
		  })
		}; */
$(document).ready(function() {
		$("#createReference").on("click", function() {
		  location.href='/WithProject/referenceRoom/referenceRegisteForm.do';
		});
	

  
/* 	var nameNo = $("#name").val();  
	console.log(nameNo);
	function referenceList(nameNO) {
	  $.getJSON("{pageContext.request.contextPath}/referenceRoom/referenceList.do", 
	      							{nameNo : nameNo}, function (response) {
	    	var listHtml = "";
				$.each(response, function (index, value) {
		    	listHtml += "<div"
					  
				})	    	
 */	  
});
		
		

	
</script>
<style>
		* {
		  margin: 0;
		  padding: 0;
		}
		
		ul, li {
		  list-style: none;
		}
		
		body {
		  font: normal 14px/1.5 "Arial","Lucida Grande",Verdana,"Microsoft YaHei","hei";
		}
		
		.cui-tab {
		  display: -webkit-box;
		  display: -moz-box;
		  display: -ms-flexbox;
		  display: -webkit-flex;
		  display: flex;
		  height: 43px;
		  line-height: 43px;
		  border-bottom: #969696 1px solid;
		  background-color: #fafafa;
		  color: #666;
		  font-size: 15px;
		  position: relative;
		}
		
		.cui-tab label {
		  text-align: center;
		  -webkit-box-flex: 1;
		  -moz-box-flex: 1;
		  -webkit-flex: 1;
		  -ms-flex: 1;
		  flex: 1;
		  display: block;
		  position: relative;
		}
		
		.cui-tab label:nth-of-type(1)::after {
		  position: absolute;
		  left: 0;
		  content: "";
		  height: 4px;
		  bottom: -1px;
		  width: 100%;
		  background-color: #099fde;
		  -webkit-transition: -webkit-transform 550ms ease-in-out;
		}
		
		.cui-tab input {
		  display: none;
		}
		
		.cui-tab input:nth-of-type(1):checked ~ label:nth-of-type(1), .cui-tab input:nth-of-type(2):checked ~ label:nth-of-type(2), .cui-tab input:nth-of-type(3):checked ~ label:nth-of-type(3), .cui-tab input:nth-of-type(4):checked ~ label:nth-of-type(4), .cui-tab input:nth-of-type(5):checked ~ label:nth-of-type(5) {
		  color: #099fde;
		}
		
		.cui-tab input:nth-of-type(1):checked ~ label:nth-of-type(1)::after {
		  -webkit-transform: translateX(0);
		}
		
		.cui-tab input:nth-of-type(2):checked ~ label:nth-of-type(1)::after {
		  -webkit-transform: translateX(100%);
		}
		
		.cui-tab input:nth-of-type(3):checked ~ label:nth-of-type(1)::after {
		  -webkit-transform: translateX(200%);
		}
		
		.cui-tab input:nth-of-type(4):checked ~ label:nth-of-type(1)::after {
		  -webkit-transform: translateX(300%);
		}
		
		.cui-tab input:nth-of-type(5):checked ~ label:nth-of-type(1)::after {
		  -webkit-transform: translateX(400%);
		}
		
		.createReference {
			width: 100px;
	    height: 40px;
	    background: #1C7EBB;
	    font-size: 15px;
	    margin-bottom:15px;
		}
		
</style>

</head>
<body class="page-sub">
	<%@ include file="/WEB-INF/view/include/common_header.jsp"%>
	<main>
	<div class="container">
		<h3 class="title">자료공유실</h3>
		<div class="referenceList">
			<button type="button" class="createReference commonBtn" id="createReference">자료 등록</button>
			<div class="cui-tab">
				<input checked="checked" type="radio" name="radio" id="name">
				<input type="radio" name="radio" id="name2">
				<input type="radio" name="radio" id="name3"> 
				<input type="radio" name="radio" id="name4"> 
				<input type="radio" name="radio" id="name5">
				<label for="name"  id="전체">전체</label> 
				<label for="name2"  id="이미지/그래픽">이미지/그래픽</label>
				<label for="name3"  data-str="문서자료">문서자료</label> 
				<label for="name4"  data-str="동영상">동영상</label>
				<label for="name5"  data-str="▼">▼</label>
			</div>
			<div id="selectList"></div>
	</div>
	</main>
</body>
</html>
