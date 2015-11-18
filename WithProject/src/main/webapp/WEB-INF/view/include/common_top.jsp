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
    
    if ("${no}" != null) {
      
      var socket = io.connect("http://localhost:10001");
      
      socket.emit("setMemberNo", "${no}");
      
      socket.on("setMemberNo", function(data){
        
      $(".rUserList").empty();
        for(var i in data){
          if(id != data[i]){
               $(".rUserList").append("<input type='checkbox' id='member"+data[i]+"' class='member' />"+data[i])
             }
           }
      })
         
			socket.on("msg", function(data){
			  $("#msgList").appnend("<p>"+data.sendId+":"+data.msg+"</p>");
			});
      
			$("#sendMsg").click(function() {
          $(".member:checked").each(function(){
            var recvId = $(this).attr("id").slice(6);
            if($("#msg").val() != ""){
          		socket.emit("msg", { recvId : recvId, sendId : "${no}", sendMsg : $("#msg").val()});
            }else{
              alert("내용입력하세용");
              $("#msg").focus();
            }
          })
          $("#msg").val("");  
        });
  }   
});
// 					var div = "";
// 					var list = "";
//            $(".studyMemberList").empty();
//            $.post("/WithProject/member/groupList.json", {memberNo:"${no}"}, function(data){
//              $.each(data, function(index, MemberVO){
            
//                div += "<div id='"+data[index].groupNo+"'>";
//                	div += "<p class='node-title'> ○.○"+data[index].groupNo+" 번 그룹</p>";
//                		div += "<ul style='display:none;'>";   
//                			 // 멤버 출력
//                			 $.ajax({
//                			  url : "/WithProject/member/memberList.json?groupNo="+data[index].groupNo,
//                			  type: "POST",
//                			  datatype : "JSON",
//                			  success:function(member, status){
//                			   list = "";
//                			    $.each(member, function(no, MemberVO){
//                			     		list += "<li>멤버"+member[no].memberNo+"<input type='button' value='쪽지' /></li>";
               			    		
//                			    	})
//                			    	$('#'+data[index].groupNo+' ul').append(list);
//                			  	}
//                			  })
        		    	  
//       	         	div += "</ul>"
//                div += "</div>";
//              })
//              $(".studyMemberList").append(div);
             
//              test();
//            })
//       	}
//     })
//     function test() {
//     $('.node-title').on('click', function(){
//       $(this).next().slideToggle();
//     });
//  } 
						
  </script>