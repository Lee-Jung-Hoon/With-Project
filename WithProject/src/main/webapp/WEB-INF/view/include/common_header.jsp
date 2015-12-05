<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<script>

	 console.log("클릭이벤트");
	  socket = io.connect("http://192.168.0.6:10001");
	  
	    /* 메시지 보내기 버튼 클릭시*/
	  function sendMsg(){
	    $('.pin-msg-send').on('click', function(){
	      var content = $(this).parent().prev().val();
	      var recvName = $(this).parent().prev().prev().find('em').text();
	      console.log("내용"+content+"받는놈"+recvName);
	          var array = [];
	      $(this).parent().prev().prev().find('.add-name em').each(function(){
	        array.push($(this).attr("data-id"));
	        console.log("체크된 숫자"+ array);
	      });
	      
	      $.each(array, function(i, value){
	        var arrayId = array[i];
	        var gNo = array[i].split("member")[1];
	        var groupNo = gNo.split("_")[0];
	        var recvId = gNo.split("_")[1];
	        console.log(memberNo+"받는사람"+groupNo+"그룹번호");
	        socket.emit("msg", {recvName: recvName, recvId: recvId, sendId : "${no}", sendMsg : content, groupNo : groupNo, date: new Date().toUTCString()});
	          $(".messageLI").click();
	        });
	      })
	  }
	  
	  
	  // 그룹 리스트 클릭시 function
	  function slideGroupList() {
	    $('.pin-list-group').on('click', function(){
	      $(this).toggleClass('on').parent().toggleClass('current');
	    });
	  }
	  
	   /* 받는사람 체크박스 function */
	   function memberAdd(tag) {
	     var isSameId = false;
	    var id = tag.attr('id');
	    var txt = tag.next().text();
	    var html = "<em data-id='"+id+"'>"+ txt +"</em>";
	    
	    if (tag.prop('checked') == true) {
	      $('.add-name em').each(function(){
	        if ($(this).attr('data-id') == id) {
	          isSameId = true;
	        } 
	      });
	      if (isSameId == false) {
	        $('.add-name').prepend(html); 
	      }
	    } else {
	      $('.add-name em').each(function(){
	        if ($(this).attr('data-id') == id) {
	          $(this).remove();
	        } 
	      });
	    }
	   }
	   
	   // 메세지 답장 및 읽기 관련
	   function msgMain() {
	      $('.pin-msg-toggle').on('click',function(){
	      if ($(this).hasClass('on')) {
	        $(this).removeClass('on').next().removeClass('current');
	      } else {
	        var msgNo = $(this).next().find('#msgNum').val();
	        var index = $(this).parent().index();
	        $.post("/WithProject/msg/updateMsg.do", { msgNo : msgNo });
	        console.log(index);
	        var heightL = $('.pin-msg > p').height();
	         var height = $('.pin-msg li').height();
	         $(this).addClass('on').next().addClass('current').parent().siblings().find('.pin-msg-toggle').removeClass('on').next().removeClass('current');
	         $('.pin-content').stop().scrollTop(heightL + (index * height));
	      }
	     });
	      /* 받은 메세지 답장 보내기 클릭 시 */
	      $('.msg-send').on('click', function(){
	         var txt = $(this).parents('.current').prev().find('span').text();
	         var groupNo = $(this).parent().prev().val();
	         
	         $('.pin-msg').addClass('off');
	         $('.pin-msg-new1').addClass('on');
	         $('.pin-msg-newTxt span').text(txt);
	         $('.pin-msg-newTxt span').append("<input type='hidden' id='recvGroupNo' value='"+groupNo+"' />");
	         $('.pin-msg-newTxt span').append("<input type='hidden' id='recvMemberNo' value='"+groupNo+"' />");
	      });
	      $('#recvMsg').on('click', function(){
	        var content = $(this).parent().prev().val();
	        var groupNo = $(this).parent().prev().prev().find('#recvGroupNo').val();
	        var recvId = $(this).parent().prev().prev().find('#recvMemberNo').val();
	        var recvName = $(this).parent().prev().prev().find('em').text();
	        socket.emit("msg", {recvName: recvName, recvId: recvId , sendId : "${no}", sendMsg : content, groupNo : groupNo, date: new Date().toUTCString()});
	        $(".messageLI").click();
	      })
	  }
	   
	    /* 받은 메세지 리스트 클릭 시 */
	    function clickAction() {         
	          /* 받은 메세지 글쓰기 클릭 시 */
	          $('.pin-msg-write').on('click', function(){
	            $('.pin-msg').addClass('off');
	            $('.pin-msg-new2').addClass('on');
	          });
	          
	          /* 메세지 보내기 받는사람 추가 클릭 시 */
	          $('.pin-msg-add').on('click', function(){
	            $(this).toggleClass('on');
	            $('.pin-add-list').toggleClass('on');
	          });
	          
	          /* 받는사람 체크박스 전체 클릭시 */
	          $('.member-all').on('change',function(){
	            if ($(this).prop('checked') == true) {
	              $(this).parent().nextAll().find('input').prop('checked',true);
	            } else {
	              $(this).parent().nextAll().find('input').prop('checked',false);
	            }
	            $(this).parent().nextAll().find('input').each(function(){
	              memberAdd($(this));
	            });
	          });
	            
	          /* 받는사람 각각 클릭시 */
	           $('.list-member').on('change', function(){
	             memberAdd($(this));
	           });
	          
	          /* 뒤로가기 버튼 클릭시 */
	           $('.pin-msg-back').on('click',function(){
	             $(".messageLI").click();
	           });
	    };

    $(document).ready(function() {
    
    var socket;
    if ("${no}" != null && "${no}" != "") {

      socket = io.connect("http://192.168.0.6:10001");
      var id = "${no}";
      socket.emit("setMemberNo", id);
      
      
      socket.on("msg", function(data){
        $.noticeAdd({"text": "<div id='div"+data.cntId+"'>"+data.recvName+" 님에게 메시지 도착. </div>"+data.date});
        console.log(data.sendMsg);
      	})
      	
      	
      	socket.on("alarm", function(data){
        console.log("시험등록 진짜 들어왔니~~?" );
        $.noticeAdd({"text": "<div>"+data.sendName+"님이 시험을 등록. </div>"});
        })
                  
        socket.on("scheduleAlarm", function(data){
        console.log("일정등록 진짜 들어왔니~~?" );
        $.noticeAdd({"text": "<div>"+data.sendName+"님이 일정을 등록. </div>"});
        })
    
    var d = new Date();
    
    // 상단 핀 내 즐겨찾기 탭 클릭시
    $(".bookmarkLI").on('click', function() {
      var html = "";
     	html += "<div id='bookmarkList' style='font-size: 20px; line-height:30px; height:auto;'>";
      $.ajax({
        url: "${pageContext.request.contextPath}/studygroup/groupBookmarkList.json"
      })
      .done(function(response) {
        $.each(response, function(index, StudygroupVO) {
          console.log(response[index]);
          html += "<li class='bookmark_content bookmark_"+response[index].groupNo+"'>";
          html += "<div class='bookmark-left'>";
          html += "<img src='/WithProject/images/"+response[index].groupRepImagePath+"'/>";
          html += "</div>";
          html += "<div class='bookmark-right'>";
          html += "<span><a href='#' onclick='mapDetail("+response[index].groupNo+")'>"+response[index].groupName+"</a></span>";
          html += "<span>"+response[index].groupActivePlace+"</span><br/>";
          html += "<span>"+response[index].groupRecruitStartDate+"</span>";
          html += "<span> ~ </span>";
          html += "<span>"+response[index].groupRecruitEndDate+"</span>";
          html += "</div>"
          html += "</li>";
        });
      	html += "</div>";
				$(".pin-content").html("").append(html);
      });
      
    })
    
    // 상단 핀 내 마이스터디 탭 클릭시
    $(".mystudyLI").on('click', function() {
      var html = "";
	    html += "<div class='myCreateGroupList'>생성한 스터디그룹</div>"
      html += "<div class='myJoinGroupList'>가입 스터디그룹</div>"
      html += "<div class='myWatingGroupList'>가입 대기 스터디그룹</div>"
			$(".pin-content").html("").append(html);
			
      // 내가 생성한 스터디그룹 출력하는 AJAX
      $.ajax({
			  url : "${pageContext.request.contextPath}/studygroup/myCreateGroup.json"
			})
			.done(function(response) {
			  html = "<ul class='mystudyUL'>";
			  $.each(response, function(index, StudygroupVO) {
			    html += "<li><a class='list-toggle eft-light2' href='${pageContext.request.contextPath}/studygroup/StudygroupMain.do?groupNo="+response[index].groupNo+"' style='font-size:15px;'>"+response[index].groupName+"</a></li>";
        });
			  html += "</ul>";
			  $(".myCreateGroupList").append(html);
      });
			
      // 내가 가입한 스터디그룹 출력하는 AJAX
      $.ajax({
			  url : "${pageContext.request.contextPath}/studygroup/myJoinGroup.json"
			})
			.done(function(response) {
			  html = "<ul class='mystudyUL'>";
			  console.log(response);
			  $.each(response, function(index, StudygroupVO) {
			    html += "<li><a class='list-toggle eft-light2' href='${pageContext.request.contextPath}/studygroup/StudygroupMain.do?groupNo="+response[index].groupNo+"' style='font-size:15px;'>"+response[index].groupName+"</a></li>";
        });
			  html += "</ul>";
			  $(".myJoinGroupList").append(html);
      });
      
   		// 현재 가입 신청 후 승인 대기중인 스터디그룹 출력하는 AJAX
      $.ajax({
			  url : "${pageContext.request.contextPath}/studygroup/myWatingGroupList.json"
			})
			.done(function(response) {
			  html = "<ul class='mystudyUL'>";
			  console.log(response);
			  $.each(response, function(index, StudygroupVO) {
			    html += "<li><a class='list-toggle eft-light2' href='#' onclick='mapDetail("+response[index].groupNo+")' style='font-size:15px;'>"+response[index].groupName+"</a></li>";
        });
			  html += "</ul>";
			  $(".myWatingGroupList").append(html);
      });
    })
    
    
    // 상단 핀 내 메세지 탭 클릭시
    $(".messageLI").on('click', function() {
      
      var messageListHTML = "";
      
   messageListHTML += "<div class='pin-msg'>";
   messageListHTML += "<p class='title-common'>받은 메세지</p>";
   messageListHTML += "<ul>";
   messageListHTML += "</ul>";
   messageListHTML += "<button type='button' class='pin-msg-write commonBtn3'>글쓰기</button>";
   messageListHTML += "</div>";
   messageListHTML += "<div class='pin-msg-new pin-msg-new1'>"
   messageListHTML += "<div class='pin-msg-newIn'>"
   messageListHTML += "<p class='title-common'>답장 보내기</p>"
   messageListHTML += "<div class='pin-msg-newTxt'>"
   messageListHTML += "<p><strong>받는사람 &nbsp;:</strong><span></span></p>"
   messageListHTML += "<textarea></textarea>"
   messageListHTML += "<div class='pin-msg-btn'>"
   messageListHTML += "<button type='button' class='pin-msg-back commonBtn2'><em>취소</em></button>"
   messageListHTML += "<button type='button' id='recvMsg' class='pin-msg-send commonBtn2'><em>보내기</em></button>"
   messageListHTML += "</div>"
   messageListHTML += "</div>"
   messageListHTML += "</div>"
   messageListHTML += "</div>"
   messageListHTML
   messageListHTML += "<div class='pin-msg-new pin-msg-new2'>";
   messageListHTML += "   <div class='pin-msg-newIn'>";
   messageListHTML += "      <p class='title-common'>메세지 보내기</p>";
   messageListHTML += "      <div class='pin-msg-newTxt'>";
   messageListHTML += "         <p><strong>받는사람 &nbsp;:</strong><span class='add-name'></span></p>";
   messageListHTML += "         <textarea></textarea>";
   messageListHTML += "     <div class='pin-msg-btn'>";
   messageListHTML += "            <button type='button' class='pin-msg-back commonBtn2'><em>취소</em></button>";
   messageListHTML += "          <button type='button' class='pin-msg-send commonBtn2'><em>보내기</em></button>";
   messageListHTML += "         </div>";
   messageListHTML += "      </div>";
   messageListHTML += "      <button type='button' class='pin-msg-add commonBtn3'>받는사람 추가</button>";
   messageListHTML += "   </div>";
   messageListHTML += "</div>";
   
   messageListHTML += "<div class='pin-add-list'>";
   messageListHTML += "<ul class='group-list'>";
   
   messageListHTML += "</ul>"
   messageListHTML += "</div>"
   
   $(".pin-content").html(messageListHTML);
   
   
   var msgListHTML = "";
   $.ajax({
     url : "/WithProject/msg/msgList.json",
     type: "POST",
     datatype: "json",
     data: {recvId : "${no}"},
     success: function(data, status){
       $.each(data, function(index, value){
         msgListHTML += "<li>";
         msgListHTML += "<button type='button' class='pin-msg-toggle eft-light2'><strong>From.</strong><span>"+data[index].memberName+"</span><em>"+data[index].regDate+"</em></button>";
         msgListHTML += "<div class='pin-msg-content'>";
         msgListHTML += "<p>"+data[index].content+"</p>";
         msgListHTML += "<input type='hidden' value='"+data[index].groupNo+"'>";
         msgListHTML += "<input type='hidden' value='"+data[index].memberNo+"'>";
         msgListHTML += "<input type='hidden' id='msgNum' value='"+data[index].msgNo+"'>";
         msgListHTML += "<span><button type='button' class='msg-send commonBtn2'><em>답장 보내기</em></button></span>";
         msgListHTML += "</div>";
         msgListHTML += "</li>";
        });
       $(".pin-content .pin-msg ul").html(msgListHTML);
       msgMain();
       }
     });
   


  var groupList = "";
  $.ajax({
     url: "/WithProject/member/groupList.json?memberNo=${no}"
   })
   .done(function(data) {   
    $.each(data, function(i, MemberVO) {
      groupList += "<li>"
      groupList += "<button type='button' id='list-"+data[i].groupNo+"' data-groupno='"+data[i].groupNo+"' class='pin-list-group'>"+data[i].groupName+"</button>"
         groupList += "      <ul id='group"+data[i].groupNo+"'>                                                                "
      
         groupList += "      </ul>"
         groupList += "</li>"
    })
     $(".group-list").append(groupList);
    clickAction();
    $(".pin-list-group").on('click', function() {
      var memberList = "";
      var groupNo = $(this).attr("data-groupno");
       $.ajax({
         url: "/WithProject/member/memberList.json?groupNo="+groupNo
       })
       .done(function(data) {
         memberList += "         <li id='group_li_"+groupNo+"'>                                                              "
         memberList += "            <input id='member"+groupNo+"_all' type='checkbox' class='member-all' />  "
         memberList += "            <label for='member"+groupNo+"_all'>전체선택</label>              "
         memberList += "         </li>"
        $.each(data, function(index, MemberVO) {
          memberList += "<li>";
          memberList += "      <input id='member"+groupNo+"_"+data[index].memberNo+"' type='checkbox' class='list-member' />"
          memberList += "      <label for='member"+groupNo+"_"+data[index].memberNo+"'>"+data[index].memberName+"</label>"
          memberList += "</li>"
        })
        $("#group"+groupNo).html("").append(memberList);
        $("#list-"+groupNo).toggleClass('on').parent().toggleClass('current');
        clickAction();
        sendMsg();
      })
    })
  })
  
    })
    }
    })
 
  </script>
  <div class="dark-layer"></div>
	<header>
		<input type="hidden" name="groupNo" value="${groupNo}" />
		<h1><a href="${pageContext.request.contextPath}/main/main.do"><span>WITH</span><em>★</em></a></h1>
		<c:choose>
    <c:when test="${!empty id}" >
      <div class="bookmarkZone">
				<div class="bookmarkZone-left">
	         <span class="img"><img src="${pageContext.request.contextPath}/images/01.jpg" alt="" /></span>
	         <span class="txt">${name}</span>
         </div>
         <button type="button" class="pin-btn">핀</button>
         <div class="pin-click">
            <ul class="pin-list">
               <li><button type="button" class='bookmarkLI'>즐겨찾기</button></li>
               <li><button type="button" class='mystudyLI'>마이스터디</button></li>
               <li><button type="button" class='messageLI'>메시지</button></li>
            </ul>
            <div class="pin-content">
            		<!--  메시지 디폴트 시작 -->
                <div class="pin-msg">
            		 <p class="title-common">받은 메세지</p>
	               <ul>
	               	<li>
	               		<button type="button" class="pin-msg-toggle eft-light2"><strong>From.</strong><span>안지원</span><em>2015-11-30 09:30</em></button>
	               		<div class="pin-msg-content">
	               			<p>내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</p>
	               			<span><button type="button" class="msg-send commonBtn2"><em>답장 보내기</em></button></span>
	               		</div>
	               	</li>
	               	<li>
	               		<button type="button" class="pin-msg-toggle eft-light2"><strong>From.</strong><span>김수한무거북이와두루미삼천갑자동방삭</span><em>2015-11-30 11:30</em></button>
	               		<div class="pin-msg-content">
	               			<p>내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</p>
	               			<span><button type="button" class="msg-send commonBtn2"><em>답장 보내기</em></button></span>
	               		</div>
	               	</li>
	               	<li>
	               		<button type="button" class="pin-msg-toggle eft-light2"><strong>From.</strong><span>케이틀린</span><em>2015-11-30 09:30</em></button>
	               		<div class="pin-msg-content">
	               			<p>내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</p>
	               			<span><button type="button" class="msg-send commonBtn2"><em>답장 보내기</em></button></span>
	               		</div>
	               	</li>
	               	<li>
	               		<button type="button" class="pin-msg-toggle eft-light2"><strong>From.</strong><span>케이틀린</span><em>2015-11-30 09:30</em></button>
	               		<div class="pin-msg-content">
	               			<p>내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</p>
	               			<span><button type="button" class="msg-send commonBtn2"><em>답장 보내기</em></button></span>
	               		</div>
	               	</li>
	               	<li>
	               		<button type="button" class="pin-msg-toggle eft-light2"><strong>From.</strong><span>케이틀린</span><em>2015-11-30 09:30</em></button>
	               		<div class="pin-msg-content">
	               			<p>내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</p>
	               			<span><button type="button" class="msg-send commonBtn2"><em>답장 보내기</em></button></span>
	               		</div>
	               	</li>
	               	<li>
	               		<button type="button" class="pin-msg-toggle eft-light2"><strong>From.</strong><span>케이틀린</span><em>2015-11-30 09:30</em></button>
	               		<div class="pin-msg-content">
	               			<p>내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</p>
	               			<span><button type="button" class="msg-send commonBtn2"><em>답장 보내기</em></button></span>
	               		</div>
	               	</li>
	               </ul>
	               <button type="button" class="pin-msg-write commonBtn3">글쓰기</button>
            	</div>
            	<!--  메시지 디폴트 끝 -->
            	
            	<!-- 답장 보내기 시작 -->
            	<div class="pin-msg-new pin-msg-new1">
            		<div class="pin-msg-newIn">
            			<p class="title-common">답장 보내기</p>
	           			<div class="pin-msg-newTxt">
	           				<p><strong>받는사람 &nbsp;:</strong><span>안지원</span></p>
	           				<textarea></textarea>
	           				<div class="pin-msg-btn">
	           					<button type="button" class="pin-msg-back commonBtn2"><em>취소</em></button>
	            				<button type="button" class="pin-msg-send commonBtn2"><em>보내기</em></button>
	           				</div>
	           			</div>
            		</div>
            	</div>
            	<!-- 답장 보내기 끝 -->
            	
            	<!--  메세지 보내기 시작 -->
            	<div class="pin-msg-new pin-msg-new2">
            		<div class="pin-msg-newIn">
            			<p class="title-common">메세지 보내기</p>
	           			<div class="pin-msg-newTxt">
	           				<p><strong>받는사람 &nbsp;:</strong><span class="add-name"></span></p>
	           				<textarea></textarea>
	           				<div class="pin-msg-btn">
	           					<button type="button" class="pin-msg-back commonBtn2"><em>취소</em></button>
	            				<button type="button" class="pin-msg-send commonBtn2"><em>보내기</em></button>
	           				</div>
	           			</div>
	           			<button type="button" class="pin-msg-add commonBtn3">받는사람 추가</button>
            		</div>
            	</div>
            	<!--  메세지 보내기 끝 -->
            	
            	<!-- 받는사람 체크박스 시작 -->
            	<div class="pin-add-list">
            		<ul>
            			<li>
            				<button type="button" class="pin-list-group">스터디1</button>
            				<ul>
            					<li>
            						<input id="member01_all" type="checkbox" class="member-all" />
            						<label for="member01_all">스터디1 전체선택</label>
            					</li>
            					<li>
            						<input id="member01_01" type="checkbox" class="list-member" />
            						<label for="member01_01">수리용</label>
            					</li>
            					<li>
            						<input id="member01_02" type="checkbox" class="list-member" />
            						<label for="member01_02">경워니</label>
            					</li>
            					<li>
            						<input id="member01_03" type="checkbox" class="list-member" />
            						<label for="member01_03">포포투우</label>
            					</li>
            				</ul>
            			</li>
            			<li>
            				<button type="button" class="pin-list-group">스터디2</button>
            				<ul>
            					<li>
            						<input id="member02_all" type="checkbox" class="member-all" />
            						<label for="member02_all">스터디2 전체선택</label>
            					</li>
            					<li>
            						<input id="member02_01" type="checkbox" class="list-member" />
            						<label for="member02_01">케이틀린</label>
            					</li>
            					<li>
            						<input id="member02_02" type="checkbox" class="list-member" />
            						<label for="member02_02">렉사이</label>
            					</li>
            					<li>
            						<input id="member02_03" type="checkbox" class="list-member" />
            						<label for="member02_03">신드라</label>
            					</li>
            					<li>
            						<input id="member02_04" type="checkbox" class="list-member" />
            						<label for="member02_04">이블린</label>
            					</li>
            					<li>
            						<input id="member02_05" type="checkbox" class="list-member" />
            						<label for="member02_05">수리용</label>
            					</li>
            				</ul>
            			</li>
            		</ul>
            	</div>
            	
            	<!-- 받는사람 체크박스 끝-->
            	
            </div>
            </div>
         </div>         
      </div>
    </c:when>
    </c:choose>
		<div class="login-area">
		<form action="${pageContext.request.contextPath}/member/login.do" method="post">
		<c:choose>
    	<c:when test="${empty id}" >
		<div class="login-sort login">
				<dl class="list maki">
          <dt>
             <button id="facebook-login-btn" type="button" class="toggle" >LOGIN</button>
          </dt>
           <dd class="fb-login">
             <em><a href="#" onclick="FB.login();">페이스 북 로그인</a></em>
          </dd>
					<dd class="input-login">
						<em><input type="text" name="id" id="id" placeholder="ID" /></em>
					</dd>
					<dd class="input-login">
						<em><input type="password" name="password" id="password" placeholder="password" /></em>
					</dd>
					<dd class="btn-login">
						<em><input type="submit" value="로그인"  /></em>
					</dd>
				</dl>
		</div>
		</c:when>
    <c:otherwise>
    <div class="login-sort logout">
    	<button type="button" id="facebook-logout-btn" class="btn-logout" onclick='location.href="${pageContext.request.contextPath}/member/logout.do"; FB.logout()'>LOGOUT</button>
		</div>               
    </c:otherwise>
    </c:choose>
		</form>
		<c:choose>
      <c:when test="${empty id}" >
			<div class="login-sort join">
			<form action="${pageContext.request.contextPath}/member/join.do" method="post">
				<dl class="list maki">
					<dt>
						<button type="button" class="toggle">JOIN</button>
					</dt>
					<dd class="input-login">
						<em><input type="text" name="memberName" id="memberName" placeholder="name" /></em>
					</dd>
					<dd class="input-login">
						<em><input type="text" name="id" id="id" placeholder="E-mail" /></em>
					</dd>
					<dd class="input-login">
						<em><input type="password" name="password" id="password" placeholder="password" /></em>
					</dd>
					<dd class="input-login">
						<em> 
						 <input type="radio" id="memberGender" name="memberGender" class="check" value="남성" />남성 
						 <input type="radio" id="memberGender" name="memberGender" class="check" value="여성" />여성 
						 <select id="memberAge" name="memberAge">
								<c:forEach begin="1940" end="2015" var="i">
									<option  value="${i}">${i}</option>
								</c:forEach>
						</select> 
								<span id="rAge"></span>
						</em>
					</dd>
					<dd class="btn-login">
						<em><input type="submit" value="로그인" /></em>
					</dd>
				</dl>
			</form>
		</div>
		</c:when>
		</c:choose>
	</div>
	<script>
			if ($('body').hasClass('page-main')) {
			  document.write('<div class="btn-search">');
			  document.write('<div class="ico-search close">');
			  document.write('<span class="element element-one"></span><span class="element element-two"></span>');
			  document.write('</div>');
			  document.write('</div>');
			}
		</script>
		<div class="main-menu">
		<button type="button" class="btn-menu eft-light">
			<span class="style-menu"><span></span></span>
			<em>MENU</em>
		</button>
		<div class="list-menu">
			<p>지역</p>
			<ul>
				<li><button type="button" class='switch' data-area="강남">강남</button></li>
				<li><button type="button" class='switch' data-area="신촌">신촌</button></li>
				<li><button type="button" class='switch' data-area="종로">종로</button></li>
				<li><button type="button" class='switch' data-area="노량진">노량진</button></li>
				<li><button type="button" class='switch' data-area="홍대">홍대</button></li>
				<li><button type="button" class='switch' data-area="김포">김포</button></li>
				<li><button type="button" class='switch' data-area="신림">신림</button></li>
				<li><button type="button" class='switch' data-area="구로">구로</button></li>
				<li><button type="button" class='switch' data-area="인천">인천</button></li>
				<li><button type="button" class='switch' data-area="대전">대전</button></li>
				<li><button type="button" class='switch' data-area="대구">대구</button></li>
				<li><button type="button" class='switch' data-area="광주">광주</button></li>
				<li><button type="button" class='switch' data-area="부산">부산</button></li>
			</ul>
			<p>내 주변</p>
			<ul>
				<li><button type="button" class='switch' data-distance="3000">근처 스터디그룹(3km)</button></li>
				<li><button type="button" class='switch' data-distance="5000">멀리 스터디그룹(5km)</button></li>
				<li><button type="button" class='switch' data-distance="8000">머어어얼리 스터디그룹(8km)</button></li>
				<li><button type="button" class='switch' data-distance="10000">머어어어어어어어어얼리 스터디그룹(10km)</button></li>
			</ul>
			<p>정렬</p>
			<ul>
				<li><button type="button">인기순</button></li>
				<li><button type="button">마감임박순</button></li>
				<li><button type="button">이름순</button></li>
			</ul>
		</div>
	</div>
	<script>
	if ($("body").hasClass("page-sub")) {
	  document.write("<aside>");
		  document.write("<h2 class='hide'>주메뉴</h2>");
				document.write("<ul>");
				document.write("<li><a href='${pageContext.request.contextPath}/calendar/schedule.do?groupNo=${groupNo}'><span>일정</span></a></li>");
					document.write("<li><a href='${pageContext.request.contextPath}/exam/examList.do?groupNo=${groupNo}'><span>시험테스트</span></a></li>");
					document.write("<li><a href='${pageContext.request.contextPath}/moneybook/moneybookMain.do?groupNo=${groupNo}'><span>가계부</span></a></li>");
					document.write("<li><a href='${pageContext.request.contextPath}/referenceRoom/referenceList.do'><span>자료실</span></a></li>");
					document.write("<li><a href='#'><span>공지사항</span></a></li>");
			document.write("</ul>");
		document.write("</aside>"); 
	}
	</script>
</header>