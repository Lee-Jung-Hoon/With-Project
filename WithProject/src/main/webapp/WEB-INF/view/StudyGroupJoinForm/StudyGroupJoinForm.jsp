<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.page-join main {
	width:100%;
/* 	padding-left:80px; */
	transition:width 1s;
	padding-top:120px;
	perspective:1200px;
}


	.page-join .title {
		font-size: 20px;
    color: #000;
    font-weight: bold;
    border-bottom: 2px solid #999;
    margin-bottom: 20px;
    padding-bottom: 20px;
    text-indent: 10px;
	}
	
	.page-join .input {
		border-bottom: 1px #000 solid;
    padding: 15px 0 35px;
/*     min-height: 300px; */
	}
	
	.page-join .input h4 {
		color: #4195f5;
    margin-bottom: 10px;
    font-weight: bold;
    font-size: 16px;
	}
	
	.page-join .group-info {
		width: 100%;
		height: 150px;
		border-radius: 5px;
    border: 1px solid #d8d8d8;
    background-color: #f8f8f8;
		padding: 20px;
		overflow: hidden;   
		font-size: 12px;
    font-weight: normal;
 
	}
	
	.page-join .group-img {
		float:left; 
		width: 13%; 
		height: 120px;
	}
	
	.page-join .group-ul {
		line-height: 20px;
		margin-left: 15px;
    float: left;
    width: 80%;
	}
	
	.page-join .user-info .user-info-help {
		height: 50px;
    line-height: 50px;
    font-size: 12px;
    font-weight: normal;
    text-align: left;
    border: 1px solid #d8d8d8;
    background-color: #f8f8f8;
    padding-left: 20px;
	}
	
	.page-join .user-info .user-left {
		float : left;
		height: 60px;
    line-height: 60px;
    width: 10%;
    font-size: 12px;
    font-weight: normal;
    text-align: right;
    border: 1px solid #d8d8d8;
    background-color: #f8f8f8;
    padding-right: 20px;
   }
   
   .page-join .user-info .user-name, .user-email {
   	float : left;
   	height: 60px;
    line-height: 60px;
    width: 40%;
    font-size: 12px;
    font-weight: normal;
    text-align: left;
    border: 1px solid #d8d8d8;
    padding-left: 20px;
   }
   
   .page-join .user-info .user-tel {
   	float : left;
   	height: 60px;
    line-height: 60px;
    width: 90%;
    font-size: 12px;
    font-weight: normal;
    text-align: left;
    border: 1px solid #d8d8d8;
    padding-left: 20px;
   }
   .page-join .user-info .user-comment {
   	float : left;
   	height: 100px;
    line-height: 100px;
    width: 90%;
    font-size: 12px;
    font-weight: normal;
    text-align: left;
    border: 1px solid #d8d8d8;
    padding-left: 20px;
   }
   
   .btnDIV {
   	    text-align: center;
    margin-top: 30px;
   }
</style>
<%@ include file="/WEB-INF/view/include/common_top.jsp"%>
<script>
$(document).ready(function () {
  var now = "${group.groupNowPerson}";
  var max = "${group.groupMaxPerson}";
  var stand = "${stand}";
  $(".progress").css("width", Number((100/max)*now)+"%");
  var html = "<div>* 총 모집인원 : "+max+"명 | 현재참여자 "+now+"명 | 대기 "+stand+"명</div>";
  $(".join-person-progress").append(html);
});
function inAlarm(groupNo, joinType){
  var socket = io.connect("http://192.168.0.6:10001");
  var groupNo = groupNo;
  var joinType = joinType;
	var id = "${no}";
	var name = "${name}"
  alert(groupNo+"룹번호  조인타입"+joinType);
	$.ajax({
  	url : "/WithProject/member/groupMaster.json",
  	type: "POST",
  	datatype : "JSON",
  	data:{groupNo : groupNo},
  	success:function(member, status){
      $.each(member, function(no, MemberVO){
    			socket.emit("inAlarm", {recvId: memberVO[no].memberNo, sendName: name, joinType: joinType});
       });
				$("#inAlarm").submit();
     }
   });
}

</script>
</head>
<body class="page-join" id="join-page">
<%@ include file="/WEB-INF/view/include/common_header.jsp"%>
	<main>
		<div class='container'>
		<form action="/WithProject/joinGroup/joinGroup.do" id="inAlarm" onsubmit="inAlarm('${group.groupNo}','${joinType}')" method="post">
			<h3 class="title">스터디그룹 가입 신청</h3>
			<div class="input">
				<h4>참여 스터디그룹</h4>
				<div class='group-info'>
					<div>
						<div class="group-img">
							<img style="width: 100%;" alt="" src="/WithProject/images/${group.groupRepImagePath}"/>
						</div>
						<div class="group-ul">
							<ul>
								<li style="font-weight: bold;">${group.groupName}</li>
								<li>모임기간 : ${group.groupStartDate} ~ ${group.groupEndDate}</li>
								<li>참여신청 : ${group.groupRecruitStartDate} ~ ${group.groupRecruitEndDate}</li>
								<li>모임장소 : ${group.groupActivePlace}</li>
								<li>
									<div>
										<div style="width: 50%; height: 10px; background: #bbb;" class='join-person-progress'>
											<div class='progress' style="background: #4195f5; height: 10px;"></div>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
      </div>
      <div class="input" style="height: 350px;">
				<h4>참여정보 입력</h4>
				<div class="user-info">
					<div class="user-info-help">
						<span>간단한 참여자 정보를 입력해 주세요.</span>
					</div>
					<div class="user-input">
						<div class='user-left'>이름</div>
						<div class="user-name">${member.memberName}</div>
						<div class="user-left">이메일</div>
					<div class="user-email">
						<input type="hidden" name="id" value="${member.id}">
						<span style="margin-top: 18px;" type="text" style="width: 150px;" name="email" id="email">
							${member.id}
						</span>
					</div>
				</div>
					
					<div>
						<div class="user-left">전화번호</div>
						<div class="user-tel">
							<select name="telFirst">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="018">018</option>
							</select>
							-
							<input name="telSecond" size="10" type="text"/>-<input name="telThird" size="10" type="text"/>		
						</div>
						<div class="user-left" style="height: 100px;">참여한마디</div>
						<div class="user-comment">
							<textarea name="comment" style="margin-top: 10px;" rows="4" cols="160"></textarea>
						</div>
					</div>
				</div>
				<input type="hidden" name="groupNo" id="groupNo" value="${group.groupNo}">
				<input type="hidden" name="memberNo" id="memberNo" value="${member.memberNo}">
      </div>
      <div class="btnDIV" >
      	<input type="submit" style="padding: 10px;" value="참가 신청"  class='btn-join'>
      	<input type="button" style="padding: 10px; margin-left: 20px;" value="취소" class='btn-cancle'>
      </div>
      <input type="hidden" name="joinType" id="joinType" value="${joinType}">
      </form>
		</div>
	
		</main>
	<%@ include file="/WEB-INF/view/include/main_bottom.jsp"%>
</body>
</html>