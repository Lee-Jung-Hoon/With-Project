<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>레이아웃</title>
   <script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.colorbox.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/colorbox.css" />
<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
    <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/grids-responsive-min.css">
   <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layouts/marketing.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/spanner.css">
	<script src="${pageContext.request.contextPath}/js/common.js"></script>
   <style>
   
   #nowDate {
    font-size: 20px;
    margin-bottom: 10px;
    margin-top: 10px;
   }
   
   </style>
<script>

$(document).ready(function(){	
  
  $(".ClassName").text("${className}호 예약 현황");
  var d = new Date();
  var date = d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate(); //현재 날짜
  $("#rsvDay").val(date);
  console.log(date);
  $("#nowDate").text($("#rsvDay").val() + " 예약 현황");
  list(date);
  
  $("#search").on("click",function(){
    
   var isCheck = confirm($("#rsvDay").val()+" 예약상황 조회하시겠습니까 ?");
   if(isCheck == false){
    return false;
   }
   else{
     var searchDate = $("#rsvDay").val();
     $.ajax({
       url:"${pageContext.request.contextPath}/reservation/searchReservation.json",
       type:"POST",
          datatype:"JSON",
          data:{startTime:searchDate},
          success:function(data, status){
          list(data);
         }
     })
   }
  });
 });
   
  function list(data){
    var today = new Date();
    var hour = today.getHours();
    var classNo = "${classNo}";
    $("#time_"+hour).parent().addClass("occupy");
    $.ajax({
      url:"/ClassroomReservation/reservation/rsvList.json",
      datatype: "json",
      data: {rsvDay:data, classNo:classNo}
    })
    .done(function(response){
       var divHTML = "";
      response.forEach(function (ReservationVO, index){
         divHTML ="";
        divHTML += "<div class='schedule blue' style='height:" + (ReservationVO.usingTime*100) + "%'>"
        divHTML += "<div>f</div></div>"
           $("#time_"+ReservationVO.startTime).append(divHTML);
       });
       $(".modifyForm").colorbox({
         iframe : true,
         title : "예약 수정",
         width : "50%",
         height : "50%"
       });
    })
  };
  
  function regReservation(){
    $.ajax({
      url:"/ClassroomReservation/reservation/reservationCheck.json",
       type:"POST",
       datatype:"JSON",
       data:$("#rsvForm").serialize(),
    })
    .done(function (msg) {
      if(msg=="false") {
        $.ajax({
           url:"/ClassroomReservation/reservation/reservation.json",
           type:"POST",
           datatype:"JSON",
           data:$("#rsvForm").serialize(),
         }).done(function(response) {
           divHTML ="";
          divHTML += "<div class='schedule blue' style='height:" + (response.usingTime*100) + "%'>"
          +"<div>"+response.resFor+"</div><div>" + response.id + "</div></div>";
           $("#time_"+response.startTime).append(divHTML);
           $('#resFor').val("");
           
           Notification.requestPermission(function (result) {

             // 요청을 무조건 승락        
       if (result === 'granted') {
         
         var massage = "아이디 : " + response.id +"\n"
                                      + "사용목적 : " +response.resFor +"\n"
                                      + "시작시간 : " + response.startTime +":00시 \n" 
                                       + "사용시간 : " + response.usingTime +":00시간";
         var iconDataURI = "${pageContext.request.contextPath}/img/img_flower2.jpg";
         var options = {
             body: massage,
             icon: iconDataURI
         }
         //데스크탑 알림 요청
         var notification = new Notification("예약되었습니다.", options);
       }
             
        setTimeout(function () {
          notification.close(); 
          }, 50000);
        });
        }); 
        $(".modifyForm").colorbox({
          iframe : true,
          title : "예약 수정",
          width : "50%",
          height : "50%"
        }); 
      }
      else {
        alert("같은 시간에 예약 내역이 존재하거나 이미 지난 시간입니다.");
      }
    })
    
          
    };
    
    function changeDate() {
    for(var i=8; i<=22; i++) {
        if(i<10) {
          $("#time_0"+i).empty(); 
        }
        else {
          $("#time_"+i).empty();
        }
      }
    list($("#rsvDay").val());
    $("#nowDate").text($("#rsvDay").val() + " 예약 현황");
  }
</script>
</head>

<body class="page-reservation">
<%@ include file="/WEB-INF/view/include/topBar.jsp" %>   

<div class="content-wrapper" style="position:static; margin-top:62px;">
    <div class="content">


         <div style="width:80%; margin:0 auto">
         
            <h1 class="ClassName"></h1>
            <div style="width: 100%; overflow:hidden;">
               <div style="width: 40%; float: left;">
  
                  <form id="rsvForm">
				            <input type="hidden" name="id" value="${userInfo}"/>
                     <div style="margin-bottom: 30px">
                     <input type="hidden" name="classNo" value="${classNo}"/>


                        <input type="date" id="rsvDay" name="rsvDay" min="2015-01-01" max="2015-12-31" onchange="changeDate();" /> 
                      <br/><br/>시작시간 <select id="startTime" name="startTime">
                           <option value="08">08:00</option>
                           <option value="09">09:00</option>
                           <option value="10">10:00</option>
                           <option value="11">11:00</option>
                           <option value="12">12:00</option>
                           <option value="13">13:00</option>
                           <option value="14">14:00</option>
                           <option value="15">15:00</option>
                           <option value="16">16:00</option>
                           <option value="17">17:00</option>
                           <option value="18">18:00</option>
                           <option value="19">19:00</option>
                           <option value="20">20:00</option>
                           <option value="21">21:00</option>
                        </select> 시
                     </div>
                     <div style="margin-bottom: 30px">
                        사용시간 <select id="usingTime" name="usingTime">
                           <option value="2">2</option>
                           <option value="3">3</option>
                           <option value="4">4</option>
                        </select> 시간
                     </div>
        
                     <div style="margin-bottom: 30px">
            예약목적 <input type="text" id="resFor" name="resFor" style="width: 400px" placeholder="예약 목적을 적어주세요." />
                     </div>

                     <div style="margin-bottom: 30px">
                        <input type="button" onclick="regReservation();" class="pure-button pure-button-primary" value="예약" />
                     </div>
                  </form>
               </div>
               <div class="time-table">
                  <p style="font-size: 30px;" id="nowDate"></p>
                  <ul>
                     <li>
                        <div class="time">08시</div>
                        <div id="time_08" class="color-block"></div>
                     </li>
                     <li>
                        <div class="time">09시</div>
                        <div id="time_09" class="color-block"></div>
                     </li>
                     <li>
                        <div class="time">10시</div>
                        <div id="time_10" class="color-block"></div>
                     </li>
                     <li>
                        <div class="time">11시</div>
                        <div id="time_11" class="color-block">
                        </div>
                     </li>
                     <li>
                        <div class="time">12시</div>
                        <div id="time_12" class="color-block"></div>
                     </li>
                     <li>
                        <div class="time">13시</div>
                        <div id="time_13" class="color-block"></div>
                     </li>
                     <li>
                        <div class="time">14시</div>
                        <div id="time_14" class="color-block"></div>
                     </li>
                     <li>
                        <div class="time">15시</div>
                        <div id="time_15" class="color-block"></div>
                     </li>
                     <li>
                        <div class="time">16시</div>
                        <div id="time_16" class="color-block"></div>
                     </li>
                     <li>
                        <div class="time">17시</div>
                        <div id="time_17" class="color-block"></div>
                     </li>
                     <li>
                        <div class="time">18시</div>
                        <div id="time_18" class="color-block"></div>
                     </li>
                     <li>
                        <div class="time">19시</div>
                        <div id="time_19" class="color-block"></div>
                     </li>
                     <li>
                        <div class="time">20시</div>
                        <div id="time_20" class="color-block"></div>
                     </li>
                     <li>
                        <div class="time">21시</div>
                        <div id="time_21" class="color-block"></div>
                     </li>
                     <li>
                        <div class="time">22시</div>
                        <div id="time_22" class="color-block"></div>
                     </li>
                  </ul>
               </div>
            </div>
         </div>


      </div>
   
  <script type="text/javascript">footer()</script>
</div>
</body>
</html>