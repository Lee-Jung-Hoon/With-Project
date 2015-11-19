<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/fullcalendar.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/notice/jquery.notice.css" />
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script src="http://www.google.com/jsapi"></script>
<script src="http://apis.daum.net/maps/maps3.js?apikey=ed9f2771750f83351d39d6973594a653"></script>
<script src="${pageContext.request.contextPath}/js/circle.js"></script>
<script src="${pageContext.request.contextPath}/js/menu.action.js"></script>
<script src="${pageContext.request.contextPath}/js/d3.v3.min.js"></script>
<script src="${pageContext.request.contextPath}/js/moment.js"></script>
<script src="${pageContext.request.contextPath}/js/fullcalendar.js"></script>
<script src="${pageContext.request.contextPath}/js/lang-all.js"></script>
<script src="${pageContext.request.contextPath}/js/common.top.function.js"></script>
<script src="${pageContext.request.contextPath}/js/velocity.min.js"></script>
<script src="http://localhost:10001/socket.io/socket.io.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/notice/jquery.notice.js"></script>	
	
<script>
var socket = "";
  $(document).ready(function() {
    var d = new Date();
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
    
    if ("${no}" != null && "${no}" != "") {
      socket = io.connect("http://localhost:10001");
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
               		 div += "<li><input type='text' id='msg' /><input type='button' value='보내기' class='send'></li>";
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
           
          socket.on("msg", function(data){
       	    console.log("들어오겠찡"+data.msg);
       	    $("#msgList").append("<div>"+data.sendId+"님에게 메시지가 도착! <input type='button' class='detail' value='보기'><p>"+data.date+"</p></div>");
       	    $('.detail').one('click', function(){
       	      $.post("/WithProject/msg/updateMsg.do", { msgNo : data.msgNo }); 
       	      $(this).parent().html("<div id='msg"+data.cntId+"'><p>내용 : "+data.msg+"</p><input type='text' id='sendText'/><input type='button' value='보내기' class='send' /></div>");
                     
                     $("#msg"+data.cntId+" > .send").click(function(){
                       var sId = data.sendId;
                       var groupNo = data.groupNo
                       if($("#sendText").val() != ""){
                       socket.emit("msg", {recvId: sId, sendId : id, sendMsg : $("#sendText").val(), groupNo : groupNo, date: new Date().toUTCString()});
                       }else{
                         alert("내용입력하세요~");
                         $("#sendText").focus();
                       }
                       $(this).parent().parent().parent().remove();
                     });
                     
                   });
       	    })          
      	}
});
    function test() {
    $('.node-title').on('click', function(){
      $(this).next().slideToggle();
    });
 }
    function msgList(id){
      socket = io.connect("http://localhost:10001");
      $(".send").click(function(){
	        console.log("눌렸다.");
	        var groupNum = $(this).parent().parent().parent().attr('id');
	        
	        console.log("그룹번호"+ $(this).parent().parent().parent().attr('id'));
	        
	        $(this).parent().siblings().find(".member:checked").each(function(){
	          var recvId = $(this).attr("id").slice(6);
	          	if($("#sendText").val() != ""){
	          	  socket.emit("msg", {recvId : recvId, sendId : id, sendMsg : $("#sendText").val(), groupNo : groupNum ,  date: new Date().toUTCString() });
	          	//  $("#sendText").val() = "";
	          	}
	          else{
	            alert("내용입력 ㄱㄱ욤");
	            $("#msg").focus();
	          }
	        })
	      })
    }
  </script>