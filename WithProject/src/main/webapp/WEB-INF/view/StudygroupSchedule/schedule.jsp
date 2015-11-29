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
	var isDR = false;
	$(document).ready(function() {
		btnInsert = $('.btn-calendar-insert');
		btnCancel = $('.btn-calendar-cancel');
		groupNo = $('.group-no').val();
		/*
		$('.cal-frame-second .update').on('click', function(){
		  updateForm(id);
		  
		});
		*/
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
	    	      element.attr('data-id',event.id); 
	          },
	          */
            // 일정 클릭
            eventClick: function(calEvent, jsEvent) {
							var offset = $('.container').offset();
							var top = offset.top;
							var left = offset.left;
							var thisTag = $(this);
							//var id = $(this).find('.fc-title').attr('data-id');
							//console.log('top : '+ offset.top);
							//console.log('left : '+ offset.left);
							//console.log($(this).find('.fc-title').text());
							$('.cal-frame-second .close').one('click', function(){
							  frameClose($(this));
							});
							$('.cal-frame-second .del').one('click', function(){
							  deleteCalendar(calEvent.id, $(this));  
							});
							$('.cal-frame-second .update').one('click', function(){
							  updateForm(calEvent.id);
							});
							$('.cal-frame-first .update').one('click', function(){
							  update(calEvent);
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
							isDR = true;
							update(event);
    		    },
    		    
						// 일정 리사이즈
    		    eventResize: function(event, delta, revertFunc) {
    		      isDR = true;
    		      update(event);
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
              $('.cal-frame-second').hide();
              $('.cal-frame-first').show(function(){
                $('.cal-frame-first .cancel').one('click', function(){
            		  frameClose($(this));
            		});
              });
              $('.color-bar').val("#3a87ad");
              $('.color-txt').val("#ffffff")
              $('.title').val("");
              $('.calendar-detail').val("");
              $('.cal-frame-first').one('click','button', function(){
                
                var title = $('.title').val();
                var colorBar = $('.color-bar').val();
                var colorTxt = $('.color-txt').val();
                var dateStart = $('.date-start').val();
                var dateEnd = $('.date-end').val();
                var detail = $('.calendar-detail').val();
                var groupNo = 1;
  		        	var memberNo = 1;
                
                if ($(this).hasClass('insert')) {
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
	      });

	    $.ajax({
         url: "${pageContext.request.contextPath}/calendar/regist_sch.json",
         data: {title:title, startDate:start, endDate:end, color:colorBar, textColor:colorTxt, calendarDetail:detail, groupNo:groupNo, memberNo:memberNo}
       }).done(function(response){
         //console.log(response);
         eventData = {
             title: title,
             start: start,
             end: end,
             id: response,
             color: colorBar,
             textColor: colorTxt,
             detail: detail
          }
         
         	
          $('#calendar').fullCalendar( 'renderEvent', eventData, false );
          //$('#calendar').fullCalendar('updateEvent',event);
       });
	   
	}
	function update(event) {
		//var color = rgb2hex(tag.css('background-color')).split('#')[1];
		//var textColor = rgb2hex(tag.css('color')).split('#')[1];
		//var detail = tag.find('.fc-title').attr('data-detail');
		//var memberNo = tag.find('.fc-title').attr('data-member');
		console.log(isDR);
		var id, start, end, title, color, textColor, detail, groupNo, memberNo;
		id = event.id
		groupNo = event.groupNo;
 		memberNo = event.memberNo;
		if (isDR == true) {
		  start = event.start;
		  end = event.end;
		  title = event.title;
		  color = event.color;
		  textColor = event.textColor;
		  detail = event.detail;
		} else {
		  start = $('.date-start').val();
	 		end = $('.date-end').val();
	 		title = $('.title').val();
	 		color = $('.color-bar').val();
	 		textColor = $('.color-txt').val();
	 		detail = $('.calendar-detail').val();
	 		console.log(detail);
		}
		start = moment(start).format("YYYY-MM-DD");
	  end = moment(end).format("YYYY-MM-DD");
    $.ajax({ 
      url: '${pageContext.request.contextPath}/calendar/update_sch.json',
      type: 'POST', 
      data: {id:id , startDate:start, endDate:end, title:title, color:color, textColor:textColor, calendarDetail:detail, groupNo:groupNo, memberNo:memberNo}
    }).done(function (response){
      if (isDR == true) {
        $('#calendar').fullCalendar('updateEvent', event);
        isDR = false;
      } else {
       
        $('#calendar').fullCalendar( 'removeEvents', id );
/*
 
 id: entry.id, 
 title: entry.title, 
 start: entry.startDate, 
 end:entry.endDate ,
 color:entry.color, 
 textColor:entry.textColor, 
 detail:entry.calendarDetail, 
 groupNo:entry.groupNo, 
 memberNo:entry.memberNo
 */
        $('#calendar').fullCalendar( 'renderEvent', {
          id : id,
          title: title,
          start: start,
          end: end,
          color: color,
          textColor: textColor,
          detail: detail,
          memberNo:memberNo
        }, true );
        //thisTag.find('.fc-title').text(title);
        //thisTag.css({'color':textColor,'background-color':color, 'border-color':color});
        frameClose($('.cancel'));
        //$('#calendar').fullCalendar( 'removeEvents' );
        //$('#calendar').fullCalendar('addEventSource', eventData);
         
      }
    });
	}
	// 삭제 수정 레이어 닫기 버튼 클릭
	
	function frameClose(closeTag) {
	  closeTag.parent().hide();
 	  $('.cal-frame-first .insert').show();
 	  $('.cal-frame-first .update').hide();
	} 
	
	//삭제 수정 레이어 일정수정 버튼 클릭
	
	function updateForm(id) {
	  $('.cal-frame-first .cancel').one('click', function(){
		  frameClose($(this));
		});
	  $('.cal-frame-second').hide();
	  $('.cal-frame-first .insert').hide();
	  $('.cal-frame-first .update').show();
	  $('.cal-frame-first').show();
	  $.ajax({
	    url: "${pageContext.request.contextPath}/calendar/update_form.json?no="+ id
	  }).done(function(data){  
	    /*
	    private int id;
	private String title;
	private String startDate;
	private String endDate;
	private String calendarDetail;
	private String color;
	private String textColor;
	private int groupNo;
	private String groupName;
	private int memberNo;
	    */
	 		$('.cal-frame-first .title').val(data.title);
	 		$('.cal-frame-first .date-start').val(data.startDate);
	 		$('.cal-frame-first .date-end').val(data.endDate);
	 		$('.cal-frame-first .color-bar').val(data.color);
	 		$('.cal-frame-first .color-txt').val(data.textColor);
	 		$('.cal-frame-first .calendar-detail').val(data.calendarDetail);
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
				<button type="button" class="insert commonBtn">등록</button>
				<button type="button" class="update commonBtn">수정</button>
				<button type="button" class="cancel commonBtn">취소</button>
				<input type="hidden" class="group-no" value="1" />
			</div>
			<div class="cal-frame-second">
				<button type="button" class="del commonBtn">일정삭제</button>
				<button type="button" class="update commonBtn">일정수정</button>
				<button type="button" class="close">닫기</button>
			</div>
			<!--
			<div class="banner" style="position:absolute; top:0; right:-160px; width:150px; height:300px; background:red;"></div>
			  -->
			
		</div>
	</main>
</body>
</html>
