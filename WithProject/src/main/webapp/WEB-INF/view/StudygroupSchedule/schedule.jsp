<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>일정 | WITH 스터디</title>
<%@ include file="/WEB-INF/view/include/common_top.jsp"%>
<script>
	var btnInsert, btnCancel, groupNo;
			//isInsert = false;
	//memberNo = 1;
	$(document).ready(function() {
		btnInsert = $('.btn-calendar-insert');
		btnCancel = $('.btn-calendar-cancel');
		groupNo = $('.group-no').val();
		$('.cal-frame-first .cancel, .cal-frame-second .close').on('click', function(){
		  frameClose($(this));
		});
		$('.cal-frame-second .update').on('click', function(){
			
		});
		
	  $(window).scroll(function() {	
   		$('.banner').animate({top:$(window).scrollTop()+"px" },{queue: false, duration: 350});       		
   	});  
		var today = moment().format('YYYY-MM-DD');		
		$.ajax({ 
            url: '${pageContext.request.contextPath}/calendar/select_sch.json', 
            type: 'GET', 
            data: { }, 
            error: function() {
                alert('there was an error while fetching events!');
            } 
        }).done(function (doc) { 
            var array = Array();
            $.each(doc, function(i, entry){ 
              array.push({id: entry.id, title: entry.title, start: entry.startDate, end:entry.endDate ,color:entry.color, textColor:entry.textColor, detail:entry.calendarDetail, groupNo:entry.groupNo, memberNo:entry.memberNo});
            }); 
            $('#calendar').fullCalendar({
           	lang : 'ko',
            header: {
                left: 'prev,next',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            defaultDate: today,
            selectable: true,
						selectHelper: true,
            editable: true,	
            events: array,
            dragOpacity: .75,
            /*
            eventRender: function(event, element) {
	    	      element.find('.fc-title').attr('data-detail',event.detail).attr('data-member',event.memberNo).attr('data-id',event.id); 
	          },
	          */
            // 일정 클릭
            eventClick: function(calEvent, jsEvent, view) {
							var offset = $('.container').offset();
							var top = offset.top;
							var left = offset.left;
							//var id = $(this).find('.fc-title').attr('data-id');
							//console.log('top : '+ offset.top);
							//console.log('left : '+ offset.left);
							$('.cal-frame-second .del').on('click', function(){
							  deleteCalendar(calEvent.id, $(this));  
							});
							$('.cal-frame-second .update').on('click', function(){
							  updateForm(calEvent.id);
							});
							$('.cal-frame-second').hide();
							$('.cal-frame-second').css({'top':jsEvent.pageY - top +'px','left':jsEvent.pageX - left +'px'}).show().find('.no').val(id);
							
              //alert('Event: ' + calEvent.detail);
              //alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
              //alert('View: ' + view.name);

              // change the border color just for fun
              //$(this).css('border-color', 'red');
            },
                
            // 일정 드롭
           	eventDrop: function(event, delta, revertFunc) {
           	 update(event, revertFunc, $(this));
    		    	},
    		    
						// 일정 리사이즈
    		    eventResize: function(event, delta, revertFunc) {
    		      update(event, revertFunc, $(this));
    		    },
    		    /*eventReceive: function(event){
    		    	   var title = event.title;
    		    	   var start = event.start.format("YYYY-MM-DD[T]HH:MM:SS");
    		    	   $('#calendar').fullCalendar('updateEvent',event);
    		    },*/
    		    select: function(start, end) {
             
							//var start2=moment(start).format();
              //var end2=moment(end).format();
              $('.date-start').val(moment(start).format().split('T')[0]);
              $('.date-end').val(moment(end).format().split('T')[0]);
              
              //$('.date-end').val(end);
              $('.cal-frame-first').show();
              $('.title').val("");
              $('.cal-frame-first').on('click','button', function(){
                
                var title = $('.title').val();
                var colorBar = $('.color-bar').val();
                var colorTxt = $('.color-txt').val();
                var dateStart = $('.date-start').val();
                var dateEnd = $('.date-end').val();
                var detail = $('.calendar-detail').val();
                var groupNo = 1;
  		        	var memberNo = 1;
                
                if ($(this).hasClass('insert')) {
                  console.log("호출함");
                  insertCalendar(title, dateStart, dateEnd, colorBar, colorTxt, detail, groupNo, memberNo);          		        
          		  } 
                $('.cal-frame-first').hide();
                $('#calendar').fullCalendar('unselect');
              });
              
              
              
              //if (title) {
                 // 모멘트로 날짜 형식 변환
                
              //}
              // 드래그 부분 없어지는 효과
              
           	}
         });
     	});
		
		
		
		
   });
	function insertCalendar(title, start, end, colorBar, colorTxt, detail, groupNo, memberNo) {
	  	var socket = io.connect("http://192.168.0.6:10001");
    	var id = "${no}";
    	$.ajax({
      	url : "/WithProject/member/memberList2.json",
      	type: "POST",
      	datatype : "JSON",
      	success:function(member, status){
	        $.each(member, function(no, MemberVO){
	          console.log("멤버이시구요~"+member[no].memberNo)
	    			socket.emit("scheduleAlarm", {sendId : member[no].memberNo});
	          });
	        }
	      })
	  
	  
	  	console.log("호출됨");
	    $.ajax({
         url: "${pageContext.request.contextPath}/calendar/regist_sch.json",
         data: {title:title, startDate:start, endDate:end, color:colorBar, textColor:colorTxt, calendarDetail:detail, groupNo:groupNo, memberNo:memberNo}
       }).done(function(response){
         console.log(response);
         eventData = {
             title: title,
             start: start,
             end: end,
             id: response,
             color: colorBar,
             textColor: colorTxt,
             detail: detail
          }
         
         	
          $('#calendar').fullCalendar( 'renderEvent', eventData, false )
          //$('#calendar').fullCalendar('updateEvent',event);
       });
	   
	}
	function update(event, revertFunc, tag) {
	  var id = event.id;
		var start = event.start;
		var end = event.end;
		var title = event.title;
		var color = event.color;
		var textColor = event.textColor;
		var detail = event.detail;
		var groupNo = event.groupNo;
		var memberNo = event.memberNo;
		//var color = rgb2hex(tag.css('background-color')).split('#')[1];
		//var textColor = rgb2hex(tag.css('color')).split('#')[1];
		//var detail = tag.find('.fc-title').attr('data-detail');
		//var memberNo = tag.find('.fc-title').attr('data-member');
	  start = moment(start).format("YYYY-MM-DD");
	  end = moment(end).format("YYYY-MM-DD");

    $.ajax({ 
      url: '${pageContext.request.contextPath}/calendar/update_sch.json',
      type: 'POST', 
      data: {id:id , startDate:start, endDate:end, title:title, color:color, textColor:textColor, calendarDetail:detail, groupNo:groupNo, memberNo:memberNo}
    }).done(function (data){
    	$('#calendar').fullCalendar('updateEvent',event);
    }).fail(function(){
    	revertFunc();
	 });
	}
	// 삭제 수정 레이어 닫기 버튼 클릭
	
	function frameClose(closeTag) {
	  closeTag.parent().hide();
	  $('.cal-frame-first .update').hide();
	  $('.cal-frame-first .insert').show();
	} 
	
	//삭제 수정 레이어 일정수정 버튼 클릭
	function updateForm(id) {
	  $('.cal-frame-second').hide();
	  $('.cal-frame-first .insert').hide();
	  $('.cal-frame-first .update').show();
	  $('.cal-frame-first').show();
	  $.ajax({
	    url: "${pageContext.request.contextPath}/calendar/update_form.json?no="+ id
	  }).done(function(){
	 		$('.cal-frame-first .title span:last').val();   
	  });
	}
	
	//삭제 수정 레이어 일정 삭제 버튼 클릭
	function deleteCalendar(id, closeTag) {
    $.ajax({     
      url: "${pageContext.request.contextPath}/calendar/delete_sch.json?no="+ id
    })
    .done(function () {   
      $('#calendar').fullCalendar('removeEvents', id);
      frameClose(closeTag);
    });
  }
	function rgb2hex(orig){
	  var rgb = orig.replace(/\s/g,'').match(/^rgba?\((\d+),(\d+),(\d+)/i);
	  return (rgb && rgb.length === 4) ? "#" +
	   ("0" + parseInt(rgb[1],10).toString(16)).slice(-2) +
	   ("0" + parseInt(rgb[2],10).toString(16)).slice(-2) +
	   ("0" + parseInt(rgb[3],10).toString(16)).slice(-2) : orig;
	 }
	
	
</script>
<style>
	.cal-frame-first {
		position:absolute;
		top:50%;
		left:50%;
		background:#fff;
		border:1px solid #ccc;
    -webkit-box-shadow:0 2px 4px rgba(0,0,0,.2);
		box-shadow:0 2px 4px rgba(0,0,0,.2);
		width:350px;
		height:400px;
		margin-top:-200px;
		margin-left:-175px;
		border:1px solid red;
		z-index:99;
		display:none;
	}
	.cal-frame-first textarea {
		resize:none;
	}
	.cal-frame-first li {
		padding:5px 0;
		overflow:hidden;
	}
	.cal-frame-first span {
		display:block;
		float:left;
	}
	.cal-frame-first span:nth-child(1) {
		width:70px;
		text-align:right;
	}
	.cal-frame-first span:nth-child(2) {
		width:150px;
		margin-left:20px;
	}
	.cal-frame-first .update {
		display:none;
	}
	.cal-frame-second {
		position:absolute;
		width:300px;
		height:200px;
		background:#fff;
    border:1px solid #ccc;
    -webkit-box-shadow:0 2px 4px rgba(0,0,0,.2);
		box-shadow:0 2px 4px rgba(0,0,0,.2);
		display:none;
		z-index:99;
	}
	.cal-frame-second .close {
		display:block;
		position:absolute;
		top:10px;
		right:10px;
		width:15px;
		height:15px;
		overflow:hidden;
		text-indent:-5000px;
		background:url('/WithProject/images/icon_close_cal.png') no-repeat center;
		background-size:15px 15px;
	}	
</style>
</head>
<body class="page-sub">
	<%@ include file="/WEB-INF/view/include/common_header.jsp"%>
	<main>
		<div class="container">
			<div id="calendar"></div>
			<!-- 
			<div id="calOption" style="display:none; z-index:1; background:#eee; border: 1px solid black; width: 150px; height: 100px; position: absolute;">
				<div style="text-align: center; width:100%;"><label>일정 설정</label></div>
				<div>
					<span><a href="#" onclick="modifyCalendar();">일정수정</a></span>
					<span><a href="#" onclick="deleteCalendar();">삭제</a></span>
					<input type="hidden" id="no">
				</div>
			</div>
			 -->
			
			<div class="cal-frame-first">
				<p>일정등록</p>
				<ul>
					<li class="title-area"><span>제목 :</span><span><input type="text" class="title" /></span></li>
					<li class="start-area"><span>시작일 :</span><span><input type="date" class="date-start" /></span></li>
					<li class="end-area"><span>완료일 :</span><span><input type="date" class="date-end" /></span></li>
					<li class="color-area"><span>이벤트색 :</span><span><input type="color" class="color-bar" value="#3a87ad" /></span></li>
					<li class="txtColor-area"><span>글자색 :</span><span><input type="color" class="color-txt" value="#ffffff" /></span></li>
					<li class="detail-area"><span>상세글 :</span><span><textarea cols="30" rows="10" class="calendar-detail"></textarea></span></li>
				</ul>
				<button type="button" class="insert">등록</button>
				<button type="button" class="update">수정</button>
				<button type="button" class="cancel">취소</button>
				<input type="hidden" class="group-no" value="1" />
			</div>
			<div class="cal-frame-second">
				<button type="button" class="del">일정삭제</button>
				<button type="button" class="update">일정수정</button>
				<button type="button" class="close">닫기</button>
			</div>
			<div class="banner" style="position:absolute; top:0; right:-160px; width:150px; height:300px; background:red;"></div>
		</div>
	</main>
</body>
</html>
