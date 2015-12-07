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


$(document).ready(function() {
  
  $("#createReference").on("click", function() {
		  location.href='/WithProject/referenceRoom/referenceRegisteForm.do';
		});
	

  
 
 $(".name").click(function(event){
   var categori = $(this).attr("data-str");
   var categoriText = $(this).text();		
		if(categori == 5) {
		  console.log("이건 다른거야 ㅜㅜ 흑 언제 만들어 화면 미치겟내");
		} 
		else {
  		referenceList(categoriText);
		}  	
  })
});
	  
	  
	function referenceList(categori) {
		 $.getJSON("/WithProject/referenceRoom/referenceCategoriList.json", 
		     {categori : categori}, 
		      function (response) {
		    		var listHtml = "<ul>";
						$.each(response, function (index, value) {
						  listHtml += "<li>";
						  listHtml += "<ul>";
				    	listHtml += "<li>"+response[index].referenceNo+"</li>";
				    	listHtml += "<li class='detailSelect'><a href='/WithProject/referenceRoom/referenceDetail.do?referenceNo="+response[index].referenceNo+"'>"+response[index].referenceTitle+"</a></li>";
				    	listHtml += "<li>"+response[index].referenceCnt+"</li>";
				    	listHtml += "<li>"+response[index].memberName+"</li>";
				    	listHtml += "<li>"+response[index].referenceDate+"</li>";
				    	listHtml += "</ul>";
				    	listHtml += "</li>";
						}	);
						listHtml += "</ul>"
						$("#selectList").html(listHtml);
		     })
			}
</script>
<style>

		.shadow-z-1 {
		  -webkit-box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.12), 0 1px 2px 0 rgba(0, 0, 0, 0.24);
		  -moz-box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.12), 0 1px 2px 0 rgba(0, 0, 0, 0.24);
		  box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.12), 0 1px 2px 0 rgba(0, 0, 0, 0.24);
		}
		
		.table {
		  width: 100%;
		  max-width: 100%;
		  margin-bottom: 2rem;
		  background-color: #ffffff;
		}
		
		.table > thead > tr,
		.table > tbody > tr,
		.table > tfoot > tr {
		  -webkit-transition: all 0.3s ease;
		  -o-transition: all 0.3s ease;
		  transition: all 0.3s ease;
		}
		.table > thead > tr > th,
		.table > tbody > tr > th,
		.table > tfoot > tr > th,
		.table > thead > tr > td,
		.table > tbody > tr > td,
		.table > tfoot > tr > td {
		  text-align: center;
		  padding: 1.6rem;
		  vertical-align: top;
		  border-top: 0;
		  -webkit-transition: all 0.3s ease;
		  -o-transition: all 0.3s ease;
		  transition: all 0.3s ease;
		  
		}
		
		
		.table > tbody + tbody {
		  border-top: 1px solid rgba(0, 0, 0, 0.12);
		}
		
		.table-hover > tbody > tr:hover > td,
		.table-hover > tbody > tr:hover > th {
		  background-color: #5ACCFF;
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
		  background-color: aliceblue;
		  color: #666;
		  font-size: 14px;
		  font-weight:bold;
		  position: relative;
		  margin-bottom: 7px;
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
<body class="page-sub" id="page-sub">
	<%@ include file="/WEB-INF/view/include/common_header.jsp"%>
	<main>
		<div class="container">
			<h3 class="title">자료공유실</h3>
			<div class="referenceList">
				<button type="button" class="createReference commonBtn" id="createReference">자료 등록</button>
				<div class="table-responsive-vertical shadow-z-1">
			
			    <!-- Table starts here -->
			    <table id="table" class="table table-hover table-mc-light-blue">
    		  	<colgroup>
								<col style="width:20%" />
								<col style="width:20%" />
								<col style="width:20%" />
								<col style="width:20%" />
								<col style="width:10%" />
							</colgroup>
	    		  <thead>
			      	<tr>
				        <div class="cui-tab">
										<input checked="checked" type="radio" name="radio" id="name">
										<input type="radio" name="radio" id="name2">
										<input type="radio" name="radio" id="name3"> 
										<input type="radio" name="radio" id="name4"> 
										<input type="radio" name="radio" id="name5">
										<label for="name"  	class="name" data-str="1">NO</label> <!-- 전체 --> 
										<label for="name2" class="name" data-str="2">TITLE</label> <!-- 이미지&amp;그래픽 -->
										<label for="name3" class="name" data-str="3">WRITER</label> <!-- 문서자료 -->
										<label for="name4" 	class="name" data-str="4">DATE</label> <!-- 동영상 -->
								</div>
							</tr>
			      </thead>
			      <tbody>
				      <c:forEach var="list" items="${list}">
						        <tr>
						          <td>${list.referenceNo}</td>
						          <td>
						            <a href="/WithProject/referenceRoom/referenceDetail.do?referenceNo=${list.referenceNo}">${list.referenceTitle}</a></td>
						          <td>${list.memberName}</td>
						          <td>${list.referenceDate}</td>
						        </tr>
					        </c:forEach>
		      </tbody>
		     </table>
		  	</div>
				</div>
		</div>
	</main>
</body>
</html>
