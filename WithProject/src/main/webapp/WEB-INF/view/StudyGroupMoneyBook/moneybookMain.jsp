<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>가계부 | WITH 스터디</title>
<%@ include file="/WEB-INF/view/include/common_top.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/moneybook.css" />
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
</head>
<body class='page-sub'>
	<%@ include file="/WEB-INF/view/include/common_header.jsp"%>
	<main>
		<div class="container">
			<div class='moneybook-top'>
				<ul>
					<li>
						<a href='#' class='btnInsert'>
			      	<span class='icon-wrap'><img alt='' src='/WithProject/images/icon_dr.png' /></span>
			      	<span class='block'>
			      		<em></em><em></em><em></em><em></em>
			      		<em></em><em></em><em></em><em></em>
			      		<em></em><em></em><em></em><em></em>
			      		<em></em><em></em><em></em><em></em>
			      	</span>
			      </a>
					</li>
					
					<li>
						<a href='#' class='btnHistory'>
			      	<span class='icon-wrap'><img alt='' src='/WithProject/images/icon_his.png' /></span>
			      	<span class="block">
			      		<em></em><em></em><em></em><em></em>
			      		<em></em><em></em><em></em><em></em>
			      		<em></em><em></em><em></em><em></em>
			      		<em></em><em></em><em></em><em></em>
			      	</span>
			      </a>
					</li>
					
					<li>
						<a href='#' class='btnUp'>
			      	<span class='icon-wrap'><img alt='' src='/WithProject/images/icon_up2.png' /></span>
			      	<span class='block'>
			      		<em></em><em></em><em></em><em></em>
			      		<em></em><em></em><em></em><em></em>
			      		<em></em><em></em><em></em><em></em>
			      		<em></em><em></em><em></em><em></em>
			      	</span>
			      </a>
					</li>
					<li>
						<a href='#' class='btnDown'>
			      	<span class='icon-wrap'><img alt='' src='/WithProject/images/icon_down2.png' /></span>
			      	<span class='block'>
			      		<em></em><em></em><em></em><em></em>
			      		<em></em><em></em><em></em><em></em>
			      		<em></em><em></em><em></em><em></em>
			      		<em></em><em></em><em></em><em></em>
			      	</span>
			      </a>
					</li>
					<li>
						<a href='#' class='btnMoney'>
			      	<span class='icon-wrap'><img alt='' src='/WithProject/images/icon_money2.png' /></span>
			      	<span class='block'>
			      		<em></em><em></em><em></em><em></em>
			      		<em></em><em></em><em></em><em></em>
			      		<em></em><em></em><em></em><em></em>
			      		<em></em><em></em><em></em><em></em>
			      	</span>
			      </a>
					</li>
					<li>
						<a href='#' class='btnCard'>
			      	<span class='icon-wrap'><img alt='' src='/WithProject/images/icon_card2.png' /></span>
			      	<span class='block'>
			      		<em></em><em></em><em></em><em></em>
			      		<em></em><em></em><em></em><em></em>
			      		<em></em><em></em><em></em><em></em>
			      		<em></em><em></em><em></em><em></em>
			      	</span>
			      </a>
					</li>
					<li>
						<a href='#' class='btnGraph1'>
			      	<span class='icon-wrap'><img alt='' src='/WithProject/images/icon_gh1.png' /></span>
			      	<span class='block'>
			      		<em></em><em></em><em></em><em></em>
			      		<em></em><em></em><em></em><em></em>
			      		<em></em><em></em><em></em><em></em>
			      		<em></em><em></em><em></em><em></em>
			      	</span>
			      </a>
					</li>
					<li>
						<a href='#' class='btnGraph2'>
			      	<span class='icon-wrap'><img alt='' src='/WithProject/images/icon_gh2.png' /></span>
			      	<span class='block'>
			      		<em></em><em></em><em></em><em></em>
			      		<em></em><em></em><em></em><em></em>
			      		<em></em><em></em><em></em><em></em>
			      		<em></em><em></em><em></em><em></em>
			      	</span>
			      </a>
					</li>
					<li>
						<a href='#' class='btnGraph3'>
			      	<span class='icon-wrap'><img alt='' src='/WithProject/images/icon_gh3.png' /></span>
			      	<span class='block'>
			      		<em></em><em></em><em></em><em></em>
			      		<em></em><em></em><em></em><em></em>
			      		<em></em><em></em><em></em><em></em>
			      		<em></em><em></em><em></em><em></em>
			      	</span>
			      </a>
					</li>
				</ul>
			</div>
		<div class='content'></div>
	</div>
	<div class='modifyDIV' style='z-index: 1; display: none; position: absolute; background: white;'>
		<div class='moneybook-main pop-layer'>
			<ul>
				<li>
					<div class='main-row'>
		    		<em>날짜</em>
		    		<input type='date' name='mDate' class='date'/>
		    	</div>
				</li>
				<li>
					<div class='main-row'>
	    			<em>메모</em>
	    			<input type='text' name='mMemo' id='memo' class='memo' value=''/>
    			</div>
				</li>
				<li>
					<div class='main-row'>
		    		<em>금액</em>
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
					</li>
					<li>
						<div class='main-row-spend'>
			    		<em>지출</em>
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
					</li>
					<li>
						 <div class='main-row-import'>
				    	<em>수입</em>
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
					</li>
    		</ul>
    		<button type='button' class='reg-btn commonBtn' onclick='regMoney();'>입력</button>
    		<button type='button' class='reg-close'>닫기</button>
    	</div>
    	<input type='hidden' name='mType' id='mType' class='mType'/>
    </div>
	</main>
</body>
</html>