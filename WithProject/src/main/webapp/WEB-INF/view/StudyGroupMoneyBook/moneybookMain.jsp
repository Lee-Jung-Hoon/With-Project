<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.moneybook.js"></script>
<script src="http://d3js.org/d3.v3.min.js"></script>
<script src="/WithProject/js/Donut3D.js"></script>
<script>
$(document).ready(function() {
  $(".btnInsert").trigger('click');
})
</script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/moneybook.css" />
<title>Insert title here</title>
</head>
<body>
<div class='moneybook-top'>
	<ul>
		<li>
			<a href='#' class='btnInsert' style='padding: 5px;'>
      	<img style=' width: 30px; background: #eee;' alt='' src='/WithProject/images/icon_insert.png'/>
      </a>
		</li>
		
		<li>
			<a href='#' class='btnHistory' style='padding: 5px;'>
      	<img style=' width: 30px; background: #eee;' alt='' src='/WithProject/images/icon_history.png'/>
      </a>
		</li>
		
		<li>
			<a href='#' class='btnUp' style='padding: 5px;'>
      	<img style=' width: 30px; background: #eee;' alt='' src='/WithProject/images/icon_up.png'/>
      </a>
		</li>
		
		
		<li>
			<a href='#' class='btnDown' style='padding: 5px;'>
      	<img style=' width: 30px; background: #eee;' alt='' src='/WithProject/images/icon_down.png'/>
      </a>
		</li>
		
		<li>
			<a href='#' class='btnMoney' style='padding: 5px;'>
      	<img style=' width: 30px; background: #eee;' alt='' src='/WithProject/images/icon_money.png'/>
      </a>
		</li>
		
		<li>
			<a href='#' class='btnCard' style='padding: 5px;'>
      	<img style=' width: 30px; background: #eee;' alt='' src='/WithProject/images/icon_card.png'/>
      </a>
		</li>
		
		<li>
			<a href='#' class='btnGraph1' style='padding: 5px;'>
      	<img style=' width: 30px; background: #eee;' alt='' src='/WithProject/images/icon_graph1.png'/>
      </a>
		</li>
		
		<li>
			<a href='#' class='btnGraph2' style='padding: 5px;'>
      	<img style=' width: 30px; background: #eee;' alt='' src='/WithProject/images/icon_graph2.png'/>
      </a>
		</li>
		
		<li>
			<a href='#' class='btnGraph3' style='padding: 5px;'>
      	<img style=' width: 30px; background: #eee;' alt='' src='/WithProject/images/icon_chart.png'/>
      </a>
		</li>
	</ul>
</div>
<div class='container'></div>

</body>
</html>