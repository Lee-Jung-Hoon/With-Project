<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div class="dark-layer"></div>
	<script>
  $(document).ready(function() {
    var d = new Date();
    
    // 상단 핀 내 즐겨찾기 탭 클릭시
    $(".bookmarkLI").on('click', function() {
			$(".pin-content").html("");
    })
    
    // 상단 핀 내 마이스터디 탭 클릭시
    $(".mystudyLI").on('click', function() {
			$(".pin-content").html("");
    })
    
    // 상단 핀 내 메세지 탭 클릭시
    $(".messageLI").on('click', function() {
      var html = "";
      html += "<div id='msgList' style='font-size: 20px; line-height:30px; height:auto;'>";
      html += "<input type='button' id='newMsgList' value='새로운 메시지' />";
      html += "<div id='newMsg'></div>";
      html += "</div>";
      html += "<div class='studyMemberList' style='font-size: 20px; line-height:30px; height:auto;'>";
      html += "<div class='rUserList' style='font-size: 20px; line-height:30px; height:auto;'></div>";
      html += "</div>";
			$(".pin-content").html("").append(html);
			
			var socket = "";
			  console.log("${no}");
			  if ("${no}" != null && "${no}" != "") {
			    socket = io.connect("http://192.168.0.6:10001");
			    var id = "${no}"
			    socket.emit("setMemberNo", id);
			        var div = "";
			        var list = "";
			         $(".studyMemberList").empty();
			         $.post("/WithProject/member/groupList.json", {memberNo:"${no}"}, function(data){
			           $.each(data, function(index, MemberVO){
			             
			             div += "<div id='"+data[index].groupNo+"'>";
			              div += "<p class='node-title' style='font-size: 20px'>[-----------"+data[index].groupNo+" 번 그룹----------- ]</p>";
			                div += "<ul style='display:none;'>";
			                 div += "<li><input type='text' class='msg' /><input type='button' value='보내기' class='send'></li>";
			                   // 멤버 출력
			                   $.ajax({
			                    url : "/WithProject/member/memberList.json?groupNo="+data[index].groupNo,
			                    type: "POST",
			                    datatype : "JSON",
			                    success:function(member, status){
			                      
			                     list = "";
			                         
			                      $.each(member, function(no, MemberVO){
			                        if(id != member[no].memberNo)
			                          list += "<li stlye><input type='checkbox' class='member' id='member"+member[no].memberNo+"' value='쪽지' />멤버"+member[no].memberNo+"</li>";
			                          
			                        })
			                        $('#'+data[index].groupNo+' ul').append(list);
			                         
			                      }
			                    })
			                  
			                div += "</ul>"
			             div += "</div>";
			           })
			           $(".studyMemberList").append(div);
			           msgList(id);
			           test();
			         });
			        
			       	socket.on("alarm", function(data){
			       	  console.log("시험등록 진짜 들어왔니~~?" );
			      	  $.noticeAdd({"text": "<div>"+data.recvId+"님이 시험을 등록하셨습니다. </div>"});
			      	})
			      	
			       	socket.on("scheduleAlarm", function(data){
			       	 console.log("일정등록 진짜 들어왔니~~?" );
			      	  $.noticeAdd({"text": "<div>"+data.recvId+"님이 일정을 등록하셨습니다. </div>"});
			      	})
			         
			        socket.on("msg", function(data){
			          console.log("들어오겠찡"+data.sendMsg+"번호"+data.msgNo);
			         $.noticeAdd({"text": "<div id='div"+data.cntId+"'>"+data.sendId+" 님에게 메시지가 도착했습니다. <button class='detail'>보기</ button></div>"+data.date});
			          //$("#msgList").append("<div>"+data.sendId+"님에게 메시지가 도착! <input type='button' class='detail' value='보기'><p>"+data.date+"</p></div>");
			          $('.detail').one('click', function(){
			            $.post("/WithProject/msg/updateMsg.do", { msgNo : data.msgNo }); 
			            $(this).parent().html("<div id='msg"+data.cntId+"'><p>내용 : "+data.sendMsg+"</p><input type='text' class='msg' /><input type='button' value='보내기' class='send2' /></div>");
			                   
			                   $("#msg"+data.cntId+">.send2").click(function(){
			                     var sId = data.sendId;
			                     var groupNo = data.groupNo;
			                     if($(this).prev().val() != ""){
			                     socket.emit("msg", {recvId: sId, sendId : id, sendMsg : $(this).prev().val(), groupNo : groupNo, date: new Date().toUTCString()});
			                     }else{
			                       alert("내용입력하세요~");
			                       $(this).prev().focus();
			                     }
			                     $(this).parent().parent().parent().remove();
			                   });
			                   
			                 });
			          });    
			          
			        isAjax = true;
			          $("#newMsgList").click(function(){
			            console.log("클릭됨 ? ? ? ");
			           if (isAjax == true) {
			             $.ajax({
			               url : "/WithProject/msg/msgList.json",
			               type: "POST",
			               datatype: "json",
			               data: {recvId : id},
			               success:function(data, status){
			                newMsgList(data);
			                
			                
			               }
			             });
			             isAjax = false;
			           }else {
			             // 리무브 펑션
			             $("#newMsg > div").remove();
			             isAjax = true;
			           }
			          })
			          
			      }

			function newMsgList(data){
			  socket = io.connect("http://192.168.0.6:10001");
			  $("#newMsg").html("");
			  $.each(data, function(index, value){
			    console.log(data[index].memberNo);
			    var tag = "<div style='font-size: 10px; line-height:20px; height:auto;' > "+data[index].memberNo+"님에게 메시지가 도착"+data[index].regDate
			        +"<input type='button' class='detail "+data[index].msgNo+"' value='보기' />"
			        +"<input type='hidden' value='"+data[index].msgNo+"' /></div>";
			        $("#newMsg").append(tag);
			        test11(data[index].msgNo);
			  })
			  function test11(target) {
			    $('.'+target).one('click', function(){
			      
			      var msgNo = $('.'+target).next().val();
			      $.post("/WithProject/msg/updateMsg.do", { msgNo : msgNo });
			      $.post("/WithProject/msg/msgInfo.do", {msgNo : msgNo}, function(data){
			        console.log(data);
			        var m = eval("(" + data + ")");
			        console.log(m.content);
			        var content = "<div id='msg"+m.msgNo+"'><p>내용 : "+m.content+"</p><input type='text' class='msg' /><input type='button' value='보내기' class='send2' /></div>";
			        $('.'+target).parent().html(content);
			            $("#msg"+m.msgNo+" > .send2").click(function(){
			              console.log("내용:"+$(this).prev().val());
			              var sId = m.memberNo;
			              var groupNo = m.groupNo;
			              if($(this).prev().val() != ""){
			              $.post("/WithProject/msg/sendMsg.do", {recvId: sId, memberNo : m.recvId, content : $(this).prev().val(), groupNo : m.groupNo});
			              socket.emit("msg", {recvId: sId, sendId : m.recvId, sendMsg : $(this).prev().val(), groupNo : m.groupNo, date: new Date().toUTCString()});
			              }else{
			                alert("내용입력하세요~");
			                $(this).prev().focus();
			              }
			              $(this).parent().remove();
			            });
			          });
			      
			         });     
			  }

			}
			  function test() {
			  $('.node-title').on('click', function(){
			    $(this).next().slideToggle();
			  });
			}
			  function msgList(id){
			    socket = io.connect("http://192.168.0.6:10001");
			    $(".send").click(function(){
			        console.log("눌렸다.");
			        var groupNum = $(this).parent().parent().parent().attr('id');
			        
			        console.log("그룹번호"+ $(this).parent().parent().parent().attr('id'));
			        
			        $(this).parent().siblings().find(".member:checked").each(function(){
			          var recvId = $(this).attr("id").slice(6);
			          var txt = $(this).parent().parent().find('li:first').find('.msg');
			            if(txt != ""){
			              alert(txt.val());
			              $.post("/WithProject/msg/sendMsg.do", {recvId : recvId, memberNo : id, content : txt.val(), groupNo : groupNum });
			              socket.emit("msg", {recvId : recvId, sendId : id, sendMsg : txt.val(), groupNo : groupNum ,  date: new Date().toUTCString() });
			              txt.val("");
			            }
			          else{
			            alert("내용입력 ㄱㄱ욤");
			            $(this).prev().focus();
			          }
			        })
			      })
			  }
	  })

    $("#memberAge").on('change', function() {
      var test = (d.getFullYear() - $("#memberAge").val() + 1);
      $("#rAge").html("나이 : " + (test) + "세");
      
      var gender = document.getElementsByName('memberGender');
      for (var i = 0; i < gender.length; i++) {
        if (gender[i].checked == true) {
					console.log(gender[i].value);
        }
      }
    })   
  
//     if ("${no}" != null) {
//         socket = io.connect("http://localhost:10001");
//         socket.emit("login", "${no}");
//         var study
//         $(".studyMemberList").empty();
//         $.get("/WithProject/member/memberList.do", )
//         for(var i  in data){}
//       }
    })
  </script>
	<header>
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
               
            </div>
         </div>         
      </div>
    </c:when>
    </c:choose>
		<div class="login-area">
		<div class="login-sort login">
			<form action="${pageContext.request.contextPath}/member/login.do" method="post">
				<dl class="list maki">
				
					<c:choose>
               <c:when test="${empty id}" >
               <dt>
                  <button id="facebook-login-btn" type="button" class="toggle" >LOGIN</button>
               </dt>
               </c:when>
               <c:otherwise>
               <dt>
                     <button type="button" id="facebook-logout-btn" class="toggle" 
                                        onclick='location.href="${pageContext.request.contextPath}/member/logout.do"; FB.logout()'>LOGOUT</button>
               </dt>
               </c:otherwise>
               </c:choose>
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
			</form>
		</div>
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
				<li><button type="button" id='switch'>강남</button></li>
				<li><button type="button">신촌</button></li>
				<li><button type="button">종로</button></li>
			</ul>
			<p>정렬</p>
			<ul>
				<li><button type="button">인기순</button></li>
				<li><button type="button">마감임박순</button></li>
				<li><button type="button">이름순</button></li>
			</ul>
			<p><a href='${pageContext.request.contextPath}/exam/examList.do'>시험테스트</a></p>
			<p><a href='${pageContext.request.contextPath}/calendar/schedule.do'>일정</a></p>
		</div>
	</div>
	<script>
	if ($("body").hasClass("page-sub")) {
	  document.write("<aside>");
		  document.write("<h2 class='hide'>주메뉴</h2>");
				document.write("<ul>");
					document.write("<li><a href='${pageContext.request.contextPath}/calendar/schedule.do'><span>일정</span></a></li>");
					document.write("<li><a href='${pageContext.request.contextPath}/exam/examList.do'><span>시험테스트</span></a></li>");
					document.write("<li><a href='#'><span>가계부</span></a></li>");
					document.write("<li><a href='#'><span>자료실</span></a></li>");
					document.write("<li><a href='#'><span>공지사항</span></a></li>");
			document.write("</ul>");
		document.write("</aside>"); 
	}
	</script>
</header>