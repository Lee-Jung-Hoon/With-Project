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
              array.push({id: entry.id, title: entry.title, start: entry.startDate, end:entry.endDate ,color:"#"+entry.color, textColor:"#"+entry.textColor, detail:entry.calendarDetail, memberNo:entry.memberNo});
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
            eventRender: function(event, element) { 
	    	      element.find('.fc-title').attr('data-detail',event.detail).attr('data-member',event.memberNo); 
	          },    
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
		        	var color = rgb2hex($(this).css('background-color')).split('#')[1];
		        	var textColor = rgb2hex($(this).css('color')).split('#')[1];
		        	var detail = $(this).attr('data-detail');
		        	var memberNo = $(this).attr('data-member');
              start = moment(start).format("YYYY-MM-DD");
              end = moment(end).format("YYYY-MM-DD");
    		      $('#calendar').fullCalendar('updateEvent',event);
 		            $.ajax({ 
 		              url: '${pageContext.request.contextPath}/calendar/update_sch.json',
 		              type: 'POST', 
 		              data: {id:id , startDate:start, endDate:end, title:title, color:color, textColor:textColor, calendarcalendarDetail:detail, groupNo:groupNo, memberNo:memberNo}
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
		        	var color = rgb2hex($(this).css('background-color')).split('#')[1];
		        	var textColor = rgb2hex($(this).css('color')).split('#')[1];
		        	var detail = $(this).attr('data-detail');
		        	var memberNo = $(this).attr('data-member');
              start = moment(start).format("YYYY-MM-DD");
              end = moment(end).format("YYYY-MM-DD");
	
    		      $('#calendar').fullCalendar('updateEvent',event);
 		            $.ajax({ 
 		              url: '${pageContext.request.contextPath}/calendar/update_sch.json',
 		              type: 'POST', 
 		              data: {id:id , startDate:start, endDate:end, title:title, color:color, textColor:textColor, calendarDetail:detail, groupNo:groupNo, memberNo:memberNo}
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
             
							//var start2=moment(start).format();
              //var end2=moment(end).format();
              $('.date-start').val(moment(start).format().split('T')[0]);
              $('.date-end').val(moment(end).format().split('T')[0]);
              
              //$('.date-end').val(end);
              $('.calendar-update').show();
              $('.title').val("");
              $('.calendar-update').on('click','button', function(){
                
                var title = $('.title').val();
                var colorBar = $('.color-bar').val();
                var colorTxt = $('.color-txt').val();
                var dateStart = $('.date-start').val();
                var dateEnd = $('.date-end').val();
                var detail = $('.calendar-detail').val();
  		        	var memberNo = $(this).attr('data-member');
                
                if ($(this).hasClass('insert')) {
                  insertCalendar(title, start, end, colorBar, colorTxt, detail, groupNo, memberNo);          		        
          		  } 
                $('.calendar-update').hide();
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
	  	//console.log("${pageContext.request.contextPath}/calendar/regist_sch.json?title="+title+"&startDate="+moment(start).format('YYYY-MM-DD')+"&endDate="+moment(end).format('YYYY-MM-DD')+"&color="+colorBar.split('#')[1]+"&textColor="+colorTxt.split('#')[1]);
	    $.ajax({
         url: "${pageContext.request.contextPath}/calendar/regist_sch.json",
         data: {title:title, startDate:moment(start).format('YYYY-MM-DD'), endDate:moment(end).format('YYYY-MM-DD'), color:colorBar.split('#')[1], textColor:colorTxt.split('#')[1], calendarDetail:detail, groupNo:groupNo, memberNo:1}
       }).done(function(response){
         eventData = {
             title: title,
             start: start,
             end: end,
             id: response,
             color: colorBar,
             textColor: colorTxt
          },
         	//$('#calendar').fullCalendar
          $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
       });
	   
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
	function rgb2hex(orig){
	  var rgb = orig.replace(/\s/g,'').match(/^rgba?\((\d+),(\d+),(\d+)/i);
	  return (rgb && rgb.length === 4) ? "#" +
	   ("0" + parseInt(rgb[1],10).toString(16)).slice(-2) +
	   ("0" + parseInt(rgb[2],10).toString(16)).slice(-2) +
	   ("0" + parseInt(rgb[3],10).toString(16)).slice(-2) : orig;
	 }
	
	
</script>
<style>
	.calendar-update {
		position:absolute;
		top:50%;
		left:50%;
		background:#fff;
		width:350px;
		height:400px;
		margin-top:-200px;
		margin-left:-175px;
		border:1px solid red;
		z-index:99;
		display:none;
	}
	.calendar-update textarea {
		resize:none;
	}
	.calendar-update li {
		padding:5px 0;
		overflow:hidden;
	}
	.calendar-update span {
		display:block;
		float:left;
	}
	.calendar-update span:nth-child(1) {
		width:70px;
		text-align:right;
	}
	.calendar-update span:nth-child(2) {
		width:150px;
		margin-left:20px;
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
				<ul>
					<li><span>제목 :</span><span><input type="text" class="title" /></span></li>
					<li><span>시작일 :</span><span><input type="date" class="date-start" /></span></li>
					<li><span>완료일 :</span><span><input type="date" class="date-end" /></span></li>
					<li><span>이벤트색 :</span><span><input type="color" class="color-bar" /></span></li>
					<li><span>글자색 :</span><span><input type="color" class="color-txt" /></span></li>
					<li><span>상세글 :</span><span><textarea cols="30" rows="10" class="calendar-detail"></textarea></span></li>
				</ul>
				<button type="button" class="insert">등록</button>
				<button type="button" class="cancel">등록취소</button>
				<input type="hidden" class="group-no" value="1" />
			</div>
			<div class="banner" style="position:absolute; top:0; right:-160px; width:150px; height:300px; background:red;"></div>
		</div>
	</main>
</body>
</html>
