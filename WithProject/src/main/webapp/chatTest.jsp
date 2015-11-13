<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/chat.js"></script>
<script src="http://localhost:10001/socket.io/socket.io.js"></script>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- 메시지 알람 부분 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/notice/jquery.notice.js"></script>	
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/notice/jquery.notice.css" />	
<script>

	$(document).ready(function(){
	  // 소켓서버에 접속
	 //192.168.200.89
	 var socket = io.connect("192.168.200.89:10001");
	 var id = prompt("아이디", "아이디를 입력하세요");
	 
	 socket.emit("setId", id);
	 
	 socket.on("setId", function(data){
	   
	 	$(".userList").empty();
	 	for(var i in data){
	 	  if(id != data[i]){
	 	    $(".userList").append("<input type='checkbox' id='member"+data[i]+"' class='member' />"+data[i]);
	 	  }
	 	}
	 
	 })
	
	 socket.emit("testId",id);
	 
	 socket.on("test", function(data){
		$.noticeAdd(date.date);
	 })
	 

   socket.on("msg", function(data) {
     		
        $.noticeAdd({"text": "<div id='div"+data.cntId+"'>"+data.sendId+" 님에게 메시지가 도착했습니다. <button class='detail'>보기</ button></div>"});
        
        $(".detail").one('click', function() {
          $.post("/WithProject/msg/updateMsg.do", { msgNo : data.msgNo });
          $(this).parent().html("<div id='msg"+data.cntId+"'><p>"+data.msg+"</p><input type='text' id='sendText'/><button class='send' >보내기</ button></div>");
                
                $("#msg"+data.cntId+" > .send").click(function(){
                  var sId = data.sendId;
                  if($("#sendText").val() != ""){
                  socket.emit("msg", {recvId: sId, sendId : id, sendMsg : $("#sendText").val()});
                  }else{
                    alert("내용입력하세요~");
                    $("#sendText").focus();
                  }
                  $(this).parent().parent().parent().remove();
                });
                
              });
        });

        $("#sendMsg").click(function() {
          $(".member:checked").each(function(){
            var recvId = $(this).attr("id").slice(6);
            if($("#msg").val() != ""){
          		socket.emit("msg", { recvId : recvId, sendId : id, sendMsg : $("#msg").val()});
            }else{
              alert("내용입력하세용");
              $("#msg").focus();
            }
          })
          $("#msg").val("");  
        });
    		isAjax = true;
        $("#myMsgList").click(function(){
          if (isAjax == true) {
            $.ajax({
              url : "/WithProject/msg/msgList.json",
              type: "POST",
              datatype: "json",
              data: {recvId : id},
              success:function(data, status){
  							msgList(data);              
              }
            });
            isAjax = false;
          } else {
            // 리무브 펑션
            $("#div > div").remove();
            isAjax = true;
            
          }

        });
        
        function msgList(data){
          $("#div").html("");
          $.each(data, function(index, value){
           $("#div").append(
         	   "<div> "+data[index].sendId+"님에게 메시지가 도착했습니다."+data[index].regDate+"<button class='detail'>보기</button>"
 	                   +
         		 "</div>"
              	)
              	$(".detail").one('click', function() {
                  $.post("/WithProject/msg/updateMsg.do", { msgNo : data[index].msgNo })
                  $(this).parent().html("<div id='msg"+data[index].msgNo+"'><p>"+data[index].content+"</p><input type='text' id='sendText'/><button class='send' >보내기</ button></div>");
                        
                        $("#msg"+data[index].msgNo+" > .send").click(function(){
                          var sId = data.sendId;
                          if($("#sendText").val() != ""){
                          socket.emit("msg", {recvId: data[index].sendId, sendId : id, sendMsg : $("#sendText").val()});
                          }else{
                            alert("내용입력하세요~");
                            $("#sendText").focus();
                          }
                          $(this).parent().parent().remove();
                        });
                      });
          })
        }
        
      });
</script>
</head>
<body>
	스터디그룹맴버<br />
	<div class="userList">
	</div>
	<input type="text" id="msg" />
	<input type="button" id="sendMsg"value="메세지 전송" />
	<input type="button" id="myMsgList" value="읽지 않은 Msg보기" />
	<div id="div"></div>
	<input type="button" id="alram" value="알람테스트" />
</body>
</html>