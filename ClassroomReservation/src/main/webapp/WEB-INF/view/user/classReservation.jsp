<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>레이아웃</title>
	<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
  <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/grids-responsive-min.css">
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layouts/marketing.css">
	<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script>
	
$(document).ready(function(){
  
  $("#search").on("click",function(){
    
   var isCheck = confirm($("#sDate").val()+" 예약상황 조회하시겠습니까 ?");
   if(isCheck == false){
    return false;
   }
   else{
     var searchDate = $("#sDate").val();
     $.ajax({
       url:"${pageContext.request.contextPath}/reservation/searchReservation.json";
       type:"POST",
			 datatype:"JSON",
			 data:{startTime:searchDate},
			 success:function(data, status){
			 list(data);
			}
     })
   }
  });
  $("input[type='button']").on('click', function(){
	var result = confirm("예약하시겠습니까?");
	var startTime = $('#startTime').val();
	var usingTime = $('#rsvTime').val();
	var rsvDay = $('#rsvDay').val();
	var using = $('#using').val();
  if ($(this).val() == '예약') {
    if ($('#using').val() == "") {
          alert("사용목적을 적어주세욥");
        }
        else {
					if(result){
					  $.ajax({
							url:"${pageContext.request.contextPath}/reservation/reservation.json",
							type:"POST",
							datatype:"JSON",
							data:{ startTime:startTime, usingTime:usingTime, resFor:using, rsvDay:rsvDay },
							success:function(data, status){
							list(data);
							}
					  })
					}
					else{
					}
        }
      }

    })
  });
  function list(data){
    $("#reservationList").html("");
    $.each(data, function(index, value){
      $("#reservationList").append(
          "<p>시작시간 : "+parseInt(data[index].startTime)+":00시 &nbsp;&nbsp;종료시간"
                          +((parseInt(data[index].startTime))+(parseInt(data[index].usingTime)))+":00시"
                          +
           "</p>"
           
      );
    })
  };
  window.onload = function() {
    var d = new Date();
    var date = d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate(); //현재 날짜
    document.getElementById("sDate").value = date;
    document.getElementById("rsvDay").value = date;
  }
</script>
</head>
<body>
<div class="header">
    <div class="home-menu pure-menu pure-menu-horizontal pure-menu-fixed">
        <a class="pure-menu-heading" href="">Your Site</a>

        <ul class="pure-menu-list">
            <li class="pure-menu-item pure-menu-selected"><a href="#" class="pure-menu-link">Home</a></li>
            <li class="pure-menu-item"><a href="#" class="pure-menu-link">Tour</a></li>
            <li class="pure-menu-item"><a href="#" class="pure-menu-link">Sign Up</a></li>
        </ul>
    </div>
</div>
<div class="content-wrapper" style="position:static; margin-top:62px;">
    <div class="content" style="border: 1px solid black;">


			<div style="width: 100%">
			
				<div style="width: 100%">
					<h1>302호 강의장 정보</h1>
					<hr />
				</div>
				<div style="width: 100%">
					<input type="date" id="sDate" name="sDate" min="2015-01-01"
						max="2050-12-31" /> <input type="submit" id="search" value="조회" />
					<hr />
				</div>
				<div style="width: 100%; overflow:hidden;">
					<div style="width: 30%; float: left; border-right:1px solid gray">
					
						<div>
								<input type="date" id="rsvDay" name="rsvDay" min="2015-01-01" max="2050-12-31" />
						</div>
						<div style="margin-bottom: 30px">
							시작시간 <select id="startTime">
								<option selected="selected">08</option>
								<option>09</option>
								<option>10</option>
								<option>11</option>
								<option>12</option>
								<option>13</option>
								<option>14</option>
								<option>15</option>
								<option>16</option>
								<option>17</option>
								<option>18</option>
								<option>19</option>
								<option>20</option>
								<option>21</option>
							</select> 시
						</div>
						<div style="margin-bottom: 30px">
			사용시간 <select id="rsvTime">
								<option selected="selected">2</option>
								<option>3</option>
								<option>4</option>
							</select> 시간
						</div>

						<div  style="margin-bottom: 30px">
							예약목적 <input type="text" id="using" style="width: 400px" placeholder="예약 목적을 적어주세요."/>
						</div>
						
						<div  style="margin-bottom: 30px">
							<input type="button" value="예약" />
						</div>

					</div>
					<div style="width: 70%; float:left;">
							<div id="reservationList"></div>
					</div>
				</div>
				
			</div>


		</div>
    <div class="footer l-box is-center">
        View the source of this layout to learn more. Made with love by the YUI Team.
    </div>
</div>
</body>
</html>
