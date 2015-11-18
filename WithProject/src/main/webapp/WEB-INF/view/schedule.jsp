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
	var btnInsert, btnCancel,
			isInsert = false;
	$(document).ready(function() {
		btnInsert = $('.btn-calendar-insert');
		btnCancel = $('.btn-calendar-cancel');
		
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
                  array.push({id: entry.id, title: entry.title, start: entry.startDate, end:entry.endDate ,color:entry.color, textColor:entry.textColor});
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
                
            // 일정 클릭
            eventClick: function(event, element) {
              $('#calendar').click(function(e) {
                var pageX = e.pageX;
                var pageY = e.pageY;
	              if($("#calOption").css("display")=="none") {             
  	            	$("#calOption").css("left",pageX);
  	            	$("#calOption").css("top",pageY);
  	            	$("#no").val(event.id);
  	            	$("#calOption").show();
   	           }
    	          else {
      	        	$("#calOption").hide();
  	            	$("#no").val(event.id);
        	      }
              });
              $('#calendar').fullCalendar('updateEvent', event);
            },
                
            // 일정 드롭
           	eventDrop: function(event, delta, revertFunc) {
    		      var id = event.id;
							var start = event.start;
							var end = event.end;
		        	var title = event.title;
              start = moment(start).format("YYYY-MM-DD");
              end = moment(end).format("YYYY-MM-DD");
	
    		      $('#calendar').fullCalendar('updateEvent',event);
    		            $.ajax({ 
    		              url: '${pageContext.request.contextPath}/calendar/update_sch.json',
    		              type: 'POST', 
    		              data: {id:id , startDate:start, endDate:end, title: title}
    		            }).done(function (data){
    		            	$('#calendar').fullCalendar('updateEvent',event);
    		            }).fail(function(){
    		            	revertFunc();
    		      	  	});
    		    },
    		    
						// 일정 리사이즈
    		    eventResize: function(event, delta, revertFunc) {
    		      var id = event.id;
							var start = event.start;
							var end = event.end;
		        	var title = event.title;
              start = moment(start).format("YYYY-MM-DD");
              end = moment(end).format("YYYY-MM-DD");
	
    		      $('#calendar').fullCalendar('updateEvent',event);
    		            $.ajax({ 
    		              url: '${pageContext.request.contextPath}/calendar/update_sch.json',
    		              type: 'POST', 
    		              data: {id:id , startDate:start, endDate:end, title: title}
    		            }).done(function (data){
    		            	$('#calendar').fullCalendar('updateEvent',event);
    		            }).fail(function(){
    		            	revertFunc();
    		      	  	});
    		    },
    		    eventReceive: function(event){
    		    	   var title = event.title;
    		    	   var start = event.start.format("YYYY-MM-DD[T]HH:MM:SS");
    		    	   $('#calendar').fullCalendar('updateEvent',event);
    		    },
    		    select: function(start, end) {
              var title = prompt('Event Title:');
							var start2=moment(start).format();
              var end2=moment(end).format();
              $('.date-start').val(start2.split('T')[0]);
              $('.date-end').val(end2.split('T')[0]);
              
              //$('.date-end').val(end);
              $('.calendar-update').show();
              
              $('.calendar-update').on('click','button', function(){
                var colorBar = $('.color-bar').val();
                var colorTxt = $('.color-txt').val();
                var dateStart = $('.date-start').val();
                var dateEnd = $('.date-end').val();
                insertCalendar(title, dateStart, dateEnd, colorBar, colorTxt);  
              });
              
              
              
              //if (title) {
                 // 모멘트로 날짜 형식 변환
                
              //}
              // 드래그 부분 없어지는 효과
              $('#calendar').fullCalendar('unselect');
           	}
            });
     	});
		
		
		
		
   });
	function insertCalendar(title, dateStart, dateEnd, colorBar, colorTxt) {
	  console.log(title);
	  console.log(dateStart);
	  console.log(dateEnd);
	  console.log(colorBar);
	  console.log(colorTxt);
		  if ($(this).hasClass('insert')) {
				isInsert = true;    
		  } else {
		    $.ajax({
          url: "${pageContext.request.contextPath}/calendar/regist_sch.json?title="+title+"&startDate="+dateStart+"&endDate="+dateEnd+"&color="+colorBar+"&textColor="+colorTxt,
        }).done(function(response){
          eventData = {
              title: title,
              start: start,
              end: end,
              id: response
              //color: '#000'
           };
          	//$('#calendar').fullCalendar
           $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
        });
		    $(this).parent().hide();
		    isInsert = false;
		  }
	}
	
	function deleteCalendar() {
    $.ajax({     
      url: "${pageContext.request.contextPath}/calendar/delete_sch.json?no="+$("#no").val()
    })
    .done(function () {
      $('#calendar').fullCalendar('removeEvents', $("#no").val());
    	$("#calOption").hide();
    });
  }
	
	
</script>
<style>
	.calendar-update {
		position:absolute;
		top:50%;
		left:50%;
		background:#fff;
		width:300px;
		height:300px;
		margin-top:-150px;
		margin-left:-150px;
		border:1px solid red;
		z-index:99;
		display:none;
	}
</style>
</head>
<body class="page-sub">
	<%@ include file="/WEB-INF/view/include/common_header.jsp"%>
	<main>
		<div class="container">
			<div id="calendar"></div>
			<div id="calOption" style="display:none; z-index:1; background:#eee; border: 1px solid black; width: 150px; height: 100px; position: absolute;">
				<div style="text-align: center; width:100%;"><label>일정 설정</label></div>
				<div>
					<span><a href="#" onclick="modifyCalendar();">일정수정</a></span>
					<span><a href="#" onclick="deleteCalendar();">삭제</a></span>
					<input type="hidden" id="no">
				</div>
			</div>
			<div class="calendar-update">
				<p>일정등록</p>
				제목
				<input type="text" class="title" />
				시작일
				<input type="date" class="date-start" /><br />
				끝
				<input type="date" class="date-end" /><br />
				이벤트색
				<input type="color" class="color-bar" /><br />
				글자색
				<input type="color" class="color-txt" /><br />
				상세글
				<textarea name="" id="" cols="30" rows="10"></textarea><br />
				<button type="button" class="insert">등록</button>
				<button type="button" class="cancel">등록취소</button>
			</div>
			<div class="banner" style="position:absolute; top:0; right:-160px; width:150px; height:300px; background:red;"></div>
		</div>
	</main>
</body>
</html>
