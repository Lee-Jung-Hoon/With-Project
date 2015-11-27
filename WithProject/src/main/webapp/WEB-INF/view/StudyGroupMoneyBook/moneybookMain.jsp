<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="/WithProject/js/d3js.dashboard.js"></script>
<script src="http://d3js.org/d3.v3.min.js"></script> 
<script src="/WithProject/js/Donut3D.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.moneybook.js"></script>
<script type="text/javascript"
          src="https://www.google.com/jsapi?autoload={
            'modules':[{
              'name':'visualization',
              'version':'1',
              'packages':['corechart']
            }]
          }"></script>
<script>
$(document).ready(function() {
  $(".btnInsert").trigger('click');
  
})
</script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/moneybook.css" />
<title>Insert title here</title>
<%@ include file="/WEB-INF/view/include/common_top.jsp"%>
</head>
<body class='page-sub'>
	<%@ include file="/WEB-INF/view/include/common_header.jsp"%>
	<main>
		<div class="container">
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
<div class='content'>
</div>
</div>

	</main>
	<div class='modifyDIV' style='z-index: 1; display: none; position: absolute; background: white;'>
		<div class='moneybook-main'>
    <div class='main-row'>
    <div>날짜</div>
    <input type='date' name='mDate' class='date'/>
    </div>
    <div class='main-row'>
    <div>메모</div>
    <input type='text' name='mMemo' id='memo' class='memo' value=''/>
    </div>
    <div class='main-row'>
    <div>금액</div>
    <input type='number' name='mMoney' class='money' value='0'/>
    <div class='quick-money'>
    <div class='quick-menu'>
    <a href='#' onclick='quickMoney(100000)'>+ 100,000</a> <a href='#' onclick='quickMoney(-100000)'> -</a> <br/>
    <a href='#' onclick='quickMoney(10000)'>+ 10,000</a> <a href='#' onclick='quickMoney(-10000)'> -</a> <br/>
    <a href='#' onclick='quickMoney(1000)'>+ 1,000</a> <a href='#' onclick='quickMoney(-1000)'> -</a> <br/>
    <a href='#' onclick='quickMoney(100)'>+ 100</a> <a href='#' onclick='quickMoney(-100)'> -</a> <br/>
    <a href='#' onclick='quickMoney(10)'>+ 10</a> <a href='#' onclick='quickMoney(-10)'> -</a> <br/>
    <a href='#' onclick='quickMoney(1)'>+ 1</a> <a href='#' onclick='quickMoney(-1)'> -</a> <br/>
    <a href='#' onclick='quickMoney(0)'>초기화</a>
    </div>
    </div>
    </div>
    <div class='main-row-spend'>
    <div>지출</div>
    <input type='text' class='spend' name='mLeft'/>
    <h4>자산+</h4>
    <div>
    <span data-str='현금+' data-num='1'>현금+</span>
    <span data-str='체크카드+' data-num='1'>체크카드+</span>
    </div>
    <h4>부채-</h4>
    <div>
    <span data-str='갚을돈-' data-num='2'>갚을돈-</span>
    <span data-str='신용카드-' data-num='2'>신용카드-</span>
    </div>
    <h4>비용</h4>
    <div>
    <span data-str='식비' data-num='3'>식비</span> 
    <span data-str='교통비' data-num='3'>교통비</span> 
    <span data-str='생활용품' data-num='3'>생활용품</span><br/>
    <span data-str='교통/차량' data-num='3'>교통/차량</span> 
    <span data-str='경조사' data-num='3'>경조사</span><br/>
    <span data-str='장소대여비' data-num='3'>장소대여비</span> 
    <span data-str='미분류' data-num='3'>미분류</span>
    </div>
    </div>
    <div class='main-row-import'>
    <div>수입</div>
    <input type='text' class='import' name='mRight'/>
    <h4>자산-</h4>
    <div>
    <span data-str='현금-' data-num='1'>현금-</span>
    <span data-str='체크카드-' data-num='1'>체크카드-</span>
    </div>
    <h4>부채+</h4>
    <div>
    <span data-str='갚을돈+' data-num='2'>갚을돈+</span>
    <span data-str='신용카드+' data-num='2'>신용카드+</span>
    </div>
    <h4>수익</h4>
    <div>
    <span data-str='회비' data-num='3'>회비</span>
    <span data-str='이자' data-num='3'>이자</span>
    <span data-str='기타 수입' data-num='3'>기타 수입</span>
    <span data-str='미분류' data-num='3'>미분류</span>
    </div>
    </div>
    <div class='main-row'>
    <input type='button' class='reg-btn' value='입력' onclick='regMoney();'>
    </div>
    </div>
    <input type='hidden' name='mType' id='mType' class='mType'/>"
    
    </div>
	</div>
</body>
</html>