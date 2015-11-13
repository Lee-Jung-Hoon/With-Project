<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link href="${pageContext.request.contextPath}/css/fullcalendar.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="${pageContext.request.contextPath}/js/moment.js"></script>
<script src="${pageContext.request.contextPath}/js/fullcalendar.js"></script>
<script src="${pageContext.request.contextPath}/js/lang-all.js"></script>
<script>

	$(document).ready(function() {
		//var currentLangCode = 'ko';
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
                  array.push({id: entry.id, title: entry.title, start: entry.startDate, end:entry.endDate});
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
                
                eventClick: function(event, element) {
                  alert(event.id);
                  event.title = "CLICKED!";
                  $('#calendar').fullCalendar('updateEvent', event);
                },
                
    		    		eventDrop: function(event, delta, revertFunc) {
    		    		  alert(event.id);
									
    		        //alert(event.title + " was dropped on " + event.start.format());
								/*
    		        if (!confirm("Are you sure about this change?")) {
    		            revertFunc();
    		        }
    		        */
    		        $('#calendar').fullCalendar('updateEvent',event);
		            console.log(event.id);
								console.log(event.start);
								console.log(event.end);

    		    },
    		    eventResize: function(event, delta, revertFunc) {
    		        //alert(event.title + " end is now " + event.end.format());
								//console.log(event.start);
    		        //if (!confirm("is this okay?")) {
    		            //revertFunc();
		            console.log(event.id);
								console.log(event.start.i);
								console.log(event.end.i);
    		        $('#calendar').fullCalendar('updateEvent',event);
    		        //}
    		        /*
    		            $.ajax({ url: '${pageContext.request.contextPath}/test/update_sch.json', 
    		                type: 'POST', 
    		                data: {id:event.id , startDate:event.start, endDate:event.end} 
    		                
    		            }).done(function (data){
    		            	alert("성공");
    		            	$('#calendar').fullCalendar('updateEvent',event);
    		            }).fail(function(){
    		            	revertFunc();
    		      	  	});
    		      		*/
    		    },
    		    eventReceive: function(event){
    		    	   var title = event.title;
    		    	   var start = event.start.format("YYYY-MM-DD[T]HH:MM:SS");
    		    	   alert("!!!!!!!!!!");
    		    	   /* $.ajax({
    		    	     url: 'process.php',
    		    	     data: 'type=new&title='+title+'&startdate='+start+'&zone='+zone,
    		    	     type: 'POST',
    		    	     dataType: 'json',
    		    	     success: function(response){
    		    	       event.id = response.eventid;
    		    	       $('#calendar').fullCalendar('updateEvent',event);
    		    	     },
    		    	     error: function(e){
    		    	       console.log(e.responseText);
    		    	     }
    		    	   });
    		    	  */
    		    	   $('#calendar').fullCalendar('updateEvent',event);
    		    },
    		    select: function(start, end) {
              var title = prompt('Event Title:');
              var eventData;
             
              if (title) {
                 eventData = {
                    title: title,
                    start: start,
                    end: end
                 };
                 $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
                 // 모멘트로 날짜 형식 변환
                 start = moment(start).format("YYYY-MM-DD");
                 end = moment(end).format("YYYY-MM-DD");
                 
                 $.ajax({
                   url: "${pageContext.request.contextPath}/calendar/regist_sch.json?title="+title+"&startDate="+start+"&endDate="+end,
                 }).done(function(){
                   alert("등록성공");
                 });
              }
              // 드래그 부분 없어지는 효과
              $('#calendar').fullCalendar('unselect');
           	}
            });

     	});
		
		
   });
		


</script>
<style>

	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}

</style>
</head>
<body>

	<div id='calendar'></div>

</body>
</html>
