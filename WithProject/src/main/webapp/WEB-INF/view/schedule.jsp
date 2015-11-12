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
	  var currentLangCode = 'ko';
		var today = moment().format('YYYY-MM-DD');
		$.ajax({
	    type : "GET",
	    url : "${pageContext.request.contextPath}/test/select_sch.json",
	    datatype : "JSON"
	    //data : {resNo:resNo}
	  })
	  .done(function(response){
	    var json = "";
	    json += JSON.stringify(response);
	    alert(json);
// 	    response.forEach(function(index, TestVO) {
// 	      json+=JSONStringify(response).replace("startDate", "start").replace("endDate","end");
//       })
      alert(json);
	    $('#calendar').fullCalendar({
	      
				header: {
					left: 'prev,next today',
					center: 'title',
					right: 'month,agendaWeek,agendaDay'
				},
				defaultDate: today,
				selectable: true,
				selectHelper: true,
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
					}
					$('#calendar').fullCalendar('unselect');
				},
				editable: true,
				lang: currentLangCode,
				eventLimit: true, // allow "more" link when too many events
				events : [
				          
				  			 ]
			});
	  })
	  .fail(function(){
	    //alert("실패");
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
