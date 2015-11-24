var socket = "";
  $(document).ready(function() {
    if ("${no}" != null && "${no}" != "") {
      socket = io.connect("http://192.168.200.89:10001");
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
});
  
  function newMsgList(data){
    socket = io.connect("http://localhost:10001");
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
      socket = io.connect("http://localhost:10001");
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