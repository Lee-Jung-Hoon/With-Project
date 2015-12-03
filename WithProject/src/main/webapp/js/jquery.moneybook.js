/**
 * 가계부 관련 jQuery
 */

var cnt = 0;
var value = [];
var freqData =  [];
var lastDay = [];

$(document).ready(function() {
  // 상단 nav
  $(".moneybook-top a").on('click', function(){
    $(this).addClass('on').parent().siblings().find('a').removeClass('on');
  });
  
  // 수정 페이지 닫기
  $('.reg-close').on('click', function(){
    $('body').removeClass('dark');
    $('.modifyDIV').hide();
  })

  $(".btnInsert").on('click', function() {
   
    var html = "";
    html += "<form id='moneybookForm'>";
    html += "<div class='moneybook-main moneybook-main1'>";
    html += "<ul>";
    
    html += "<li>";
    html += "<div class='list-inner'>";
    html += "<em>날짜</em>";
    html += "<input type='date' name='mDate' class='date'/>";
    html += "</div>";
    html += "</li>";
    
    html += "<li>";
    html += "<div class='list-inner'>";
    html += "<em>메모</em>";
    html += "<input type='text' name='mMemo' id='memo' class='memo' value=''/>";
    html += "</div>";
    html += "</li>";
    
    html += "<li>";
    html += "<div class='list-inner'>";
    html += "<em>금액</em>";
    html += "<input type='number' name='mMoney' class='money' value='0'/>";
    html += "<div class='quick-money'>";
    html += "<div class='quick-menu'>";
    html += "<a href='#' onclick='quickMoney(100000)'>+ 100,000</a> <a href='#' onclick='quickMoney(-100000)'> -</a> <br/>";
    html += "<a href='#' onclick='quickMoney(10000)'>+ 10,000</a> <a href='#' onclick='quickMoney(-10000)'> -</a> <br/>";
    html += "<a href='#' onclick='quickMoney(1000)'>+ 1,000</a> <a href='#' onclick='quickMoney(-1000)'> -</a> <br/>";
    html += "<a href='#' onclick='quickMoney(100)'>+ 100</a> <a href='#' onclick='quickMoney(-100)'> -</a> <br/>";
    html += "<a href='#' onclick='quickMoney(10)'>+ 10</a> <a href='#' onclick='quickMoney(-10)'> -</a> <br/>";
    html += "<a href='#' onclick='quickMoney(1)'>+ 1</a> <a href='#' onclick='quickMoney(-1)'> -</a> <br/>";
    html += "<a href='#' onclick='quickMoney(0)'>초기화</a>";
    html += "</div>";
    html += "</div>";
    html += "</div>";
    html += "</li>";
    
    
    html += "<li>";
    html += "<div class='list-inner'>";
    html += "<em>지출</em>";
    html += "<input type='text' class='spend' name='mLeft'/>";
    html += "<h4>자산+</h4>";
    html += "<div>";
    html += "<span data-str='현금+' data-num='1'>현금+</span>";
    html += "<span data-str='체크카드+' data-num='1'>체크카드+</span>";
    html += "</div>";
    html += "<h4>부채-</h4>";
    html += "<div>";
    html += "<span data-str='갚을돈-' data-num='2'>갚을돈-</span>";
    html += "<span data-str='신용카드-' data-num='2'>신용카드-</span>";
    html += "</div>";
    html += "<h4>비용</h4>";
    html += "<div>";
    html += "<span data-str='식비' data-num='3'>식비</span> ";
    html += "<span data-str='교통비' data-num='3'>교통비</span> ";
    html += "<span data-str='생활용품' data-num='3'>생활용품</span><br/>";
    html += "<span data-str='교통/차량' data-num='3'>교통/차량</span> ";
    html += "<span data-str='경조사' data-num='3'>경조사</span><br/>";
    html += "<span data-str='장소대여비' data-num='3'>장소대여비</span> ";
    html += "<span data-str='미분류' data-num='3'>미분류</span>";
    html += "</div>";
    html += "</div>";
    html += "</li>";
   
    html += "<li>";
    html += "<div class='list-inner'>";
    html += "<em>수입</em>";
    html += "<input type='text' class='import' name='mRight'/>";
    html += "<h4>자산-</h4>";
    html += "<div>";
    html += "<span data-str='현금-' data-num='1'>현금-</span>";
    html += "<span data-str='체크카드-' data-num='1'>체크카드-</span>";
    html += "</div>";
    html += "<h4>부채+</h4>";
    html += "<div>";
    html += "<span data-str='갚을돈+' data-num='2'>갚을돈+</span>";
    html += "<span data-str='신용카드+' data-num='2'>신용카드+</span>";
    html += "</div>";
    html += "<h4>수익</h4>";
    html += "<div>";
    html += "<span data-str='회비' data-num='3'>회비</span>";
    html += "<span data-str='이자' data-num='3'>이자</span>";
    html += "<span data-str='기타 수입' data-num='3'>기타 수입</span>";
    html += "<span data-str='미분류' data-num='3'>미분류</span>";
    html += "</div>";
    html += "</div>";
    html += "</li>";
    html += "</ul>";
    
    html += "<div class='main-row main-row-insert'>";
    html += "<button type='button' class='reg-btn commonBtn' onclick='regMoney();'><span>입력</span></button>";
    html += "</div>";
    html += "</div>";
    html += "<input type='hidden' name='mType' id='mType' class='mType'/>"
    html += "</form>";
    html += "<br />";
    
    html += "<input type='hidden' name='left' class='left'/>"
    html += "<input type='hidden' name='right' class='right'/>"
    html += "<div class='moneybook-main'>";
    html += "<div class='list-header list-header2'>";
    html += "<div><span>기간</span></div>";
    html += "<div><span>사용자이름</span></div>";
    html += "<div><span>메모</span></div>";
    html += "<div><span>금액</span></div>";
    html += "<div><span>지출</span></div>";
    html += "<div><span>수입</span></div>";
    html += "</div>";
    html += "<ul class='moneybook-list'></ul>";
    html += "</div>";
    
    $(".content").html("").append(html);

    // date 클래스에 오늘 날짜를 기본 값으로 설정
    var d = new Date();
    var strDate = d.getFullYear() + "-" + (d.getMonth()+1) + "-" + d.getDate();
    $(".date").val(strDate);
    
    // 하단 거래 내역을 출력하는 부분
    selectMainList();

    // 마우스 over시 금액 리모컨 디스플레이 show
    $(".quick-money").on('mouseover', function() {
      $(".quick-menu").show();
    });
    
    // 마우스 leave시 금액 리모컨 디스플레이 hide
    $(".quick-money").on('mouseleave', function() {
      $(".quick-menu").hide();
    });
    
    // 지출 항목을 누르면 해당 span 색상을 바꾸고 형제 span의 색상을 원래로 되돌림
    // 클릭한 지출 항목을 input에 입력
    $(".main-row-spend span").on('click', function() {
      $('.main-row-spend span').siblings().css('background-color', 'white');
      $('.main-row-spend span').siblings().css('color', 'black');
      var str = $(this).attr('data-str');
      var num = $(this).attr('data-num');
      $(this).css("background", "#f08537");
      $(this).css("color", "white");
      $(".left").val(num);
      $(".spend").val(str);
    });

    // 수입 항목을 누르면 해당 span 색상을 바꾸고 형제 span의 색상을 원래로 되돌림
    // 클릭한 수입 항목을 input에 입력
    $(".main-row-import span").on('click', function() {
      $('.main-row-import span').siblings().css('background-color', 'white');
      $('.main-row-import span').siblings().css('color', 'black');
      var str = $(this).attr('data-str');
      var num = $(this).attr('data-num');
      $(this).css("background", "#f08537");
      $(this).css("color", "white");
      $(".right").val(num);
      $(".import").val(str);
    });
    
  });

  // 2번째 메뉴 버튼을 클릭시(거래 내역)
  $(".btnHistory").on('click', function() {
    var html = "";
    var d = new Date();
    html += "<div class='moneybook-main'>";

    html += "<div class='main-row-1st'>";
    html += "<span class='main-row-float'>";
    html += "<em>시작일</em>";
    html += "<input type='date' name='sDate' class='sDate'/>";
    html += "<strong>~</strong>";
    html += "</span>";
    html += "<span class='main-row-float'>";
    html += "<em>종료일</em>";
    html += "<input type='date' name='eDate' class='eDate'/>";
    html += "</span>";
    html += "<span class='main-row-float'>";
    html += "<span class='btnCheck commonBtn'><input type='button' name='btn' value='조회' class='btn'/></span>";
    html += "</span>";
    html += "</div>";
    
    
    html += "<div class='main-row-2nd'>";
    html += "<select class='year' onchange='changeYear()'>";
    html += "<option>연도별</option>";
    html += "<option>"+(d.getFullYear()-4)+"</option>";
    html += "<option>"+(d.getFullYear()-3)+"</option>";
    html += "<option>"+(d.getFullYear()-2)+"</option>";
    html += "<option>"+(d.getFullYear()-1)+"</option>";
    html += "<option>"+(d.getFullYear()-0)+"</option>";
    html += "<option>"+(d.getFullYear()+1)+"</option>";
    html += "<option>"+(d.getFullYear()+2)+"</option>";
    html += "</select>";
    html += "<select class='quarter' onchange='changeQuarter()'>";
    html += "<option>분기별</option>";
    html += "<option value='1'>"+(d.getFullYear()-1)+" 1/4</option>";
    html += "<option>"+(d.getFullYear()-1)+" 2/4</option>";
    html += "<option>"+(d.getFullYear()-1)+" 3/4</option>";
    html += "<option>"+(d.getFullYear()-1)+" 4/4</option>";
    html += "<option>"+(d.getFullYear())+" 1/4</option>";
    html += "<option>"+(d.getFullYear())+" 2/4</option>";
    html += "<option>"+(d.getFullYear())+" 3/4</option>";
    html += "<option>"+(d.getFullYear())+" 4/4</option>";
    html += "</select>";
    html += "<select class='month' onchange='changeMonth()'>";
    html += "<option>월별</option>";
    for(var i=1; i<=12; i++)
      html+="<option value='"+i+"'>"+i+"월</option>";
    html += "</select>";
    html += "</div>";

    html += "</div>";
    html += "<br />";
    html += "<div class='moneybook-main'>";
    html += "<div class='list-header'>";
    html += "<div><span>기간</span></div>";
    html += "<div><span>사용자이름</span></div>";
    html += "<div><span>메모</span></div>";
    html += "<div><span>잔액</span></div>";
    html += "<div><span>금액</span></div>";
    html += "<div><span>지출</span></div>";
    html += "<div><span>수입</span></div>";
    html += "</div>";
    html += "<ul class='moneybook-list list-second'></ul>";
    html += "</div>";
    html += "</div>";

    $(".content").html("").append(html);

    // date 클래스에 해당 달의 첫번째 날짜를 기본 값으로 설정
    var strDate = d.getFullYear() + "-" + (d.getMonth()+1) + "-" + "01";
    $(".sDate").val(strDate);

    // date 클래스에 해당 달의 마지막 날짜를 기본 값으로 설정
    var lastDay = new Date(d.getFullYear(), d.getMonth() + 1, 0);
    var lastDayWithSlashes =  lastDay.getFullYear() + '-' + (lastDay.getMonth() + 1) + "-" +(lastDay.getDate());
    $(".eDate").val(lastDayWithSlashes);

    // 하단 거래 내역을 출력하는 부분
    selectMainListOption(strDate, lastDayWithSlashes);
    
    $(".btn").on('click', function() {
      var sDate = $(".sDate").val();
      var eDate = $(".eDate").val();
      selectMainListOption(sDate, eDate);
    });
  });
  
  $(".btnUp").on('click', function() {
    var html = "";
    var d = new Date();
    html += "<div class='moneybook-main'>";
    
    html += "<div class='main-row-1st'>";
    html += "<span class='main-row-float'>";
    html += "<em>시작일</em>";
    html += "<input type='date' name='sDate' class='sDate'/>";
    html += "<strong>~</strong>";
    html += "</span>";
    
    html += "<span class='main-row-float'>";
    html += "<em>종료일</em>";
    html += "<input type='date' name='eDate' class='eDate'/>";
    html += "</span>";
    
    html += "<span class='main-row-float'>";
    html += "<span class='btnCheck commonBtn'><input type='button' name='btn' value='조회' class='btn'/></span>";
    html += "</span>";
    
    html += "</div>";
    

    html += "<div class='main-row-2nd'>";
    html += "<select class='year' onchange='changeYear()'>";
    html += "<option>연도별</option>";
    html += "<option>"+(d.getFullYear()-4)+"</option>";
    html += "<option>"+(d.getFullYear()-3)+"</option>";
    html += "<option>"+(d.getFullYear()-2)+"</option>";
    html += "<option>"+(d.getFullYear()-1)+"</option>";
    html += "<option>"+(d.getFullYear()-0)+"</option>";
    html += "<option>"+(d.getFullYear()+1)+"</option>";
    html += "<option>"+(d.getFullYear()+2)+"</option>";
    html += "</select>";

    html += "<select class='quarter' onchange='changeQuarter()'>";
    html += "<option>분기별</option>";
    html += "<option value='1'>"+(d.getFullYear()-1)+" 1/4</option>";
    html += "<option>"+(d.getFullYear()-1)+" 2/4</option>";
    html += "<option>"+(d.getFullYear()-1)+" 3/4</option>";
    html += "<option>"+(d.getFullYear()-1)+" 4/4</option>";
    html += "<option>"+(d.getFullYear())+" 1/4</option>";
    html += "<option>"+(d.getFullYear())+" 2/4</option>";
    html += "<option>"+(d.getFullYear())+" 3/4</option>";
    html += "<option>"+(d.getFullYear())+" 4/4</option>";
    html += "</select>";    

    html += "<select class='month' onchange='changeMonth()'>";
    html += "<option>월별</option>";
    for(var i=1; i<=12; i++)
      html+="<option value='"+i+"'>"+i+"월</option>";
    html += "</select>";
    html += "</div>";
    
    html += "</div>";
    html += "<br />";
    html += "<div class='moneybook-main'>";
    html += "<div class='list-header'>";
    html += "<div><span>기간</span></div>";
    html += "<div><span>사용자이름</span></div>";
    html += "<div><span>메모</span></div>";
    html += "<div><span>잔액</span></div>";
    html += "<div><span>금액</span></div>";
    html += "<div><span>지출</span></div>";
    html += "<div><span>수입</span></div>";
    html += "</div>";
    html += "<ul class='moneybook-list list-second'></ul>";
    html += "</div>";
    html += "</div>";
    
    $(".content").html("").append(html);

    // date 클래스에 해당 달의 첫번째 날짜를 기본 값으로 설정
    var strDate = d.getFullYear() + "-" + (d.getMonth()+1) + "-" + "01";
    $(".sDate").val(strDate);

    // date 클래스에 해당 달의 마지막 날짜를 기본 값으로 설정
    var lastDay = new Date(d.getFullYear(), d.getMonth() + 1, 0);
    var lastDayWithSlashes =  lastDay.getFullYear() + '-' + (lastDay.getMonth() + 1) + "-" +(lastDay.getDate());
    $(".eDate").val(lastDayWithSlashes);

    // 하단 거래 내역을 출력하는 부분
    selectMainListOption(strDate, lastDayWithSlashes);
    
    $(".btn").on('click', function() {
      var sDate = $(".sDate").val();
      var eDate = $(".eDate").val();
      selectMainListOption(sDate, eDate);
    });
  });
  
  $(".btnDown").on('click', function() {
  });
  
  $(".btnMoney").on('click', function() {
    var html = "";
    var d = new Date();
    html += "<div class='moneybook-main'>";
    html += "<div class='main-row-1st'>";
    html += "<span class='main-row-float'>";
    html += "<em>시작</em>";
    html += "<input type='month' name='sMonth' class='sMonth'/>";
    html += "<strong>~</strong>";
    html += "</span>";

    
    html += "<span class='main-row-float'>";
    html += "<em>종료</em>";
    html += "<input type='month' name='eMonth' class='eMonth'/>";
    html += "</span>";

    html += "<span class='main-row-float'>";
    html += "<span class='btnCheck commonBtn'><input type='button' name='search' value='조회' class='monthSearch'/></span>";
    html += "</span>";
    html += "</div>";
    html += "</div>";
    
    html += "<br />";
    html += "<div class='moneybook-main'>";
    html += "<div class='moneybook-list list-second'></div>";
    html += "</div>";
    html += "</div>";
    $(".content").html("").append(html);

    // date 클래스에 해당 달의 첫번째 날짜를 기본 값으로 설정
    var strDate = d.getFullYear() + "-" + (d.getMonth()+1);
    $(".sMonth").val(strDate);
    $(".eMonth").val(strDate);
    
    selectMoneyList(strDate, strDate);
    
    searchMoneyAction();
  });  

  $(".btnCard").on('click', function() {
    var html = "";
    var d = new Date();
    html += "<div class='moneybook-main'>";
    html += "<div class='main-row-1st'>";
    
    html += "<span class='main-row-float'>";
    html += "<em>시작</em>";
    html += "<input type='month' name='sMonth' class='sMonth'/>";
    html += "<strong>~</strong>";
    html += "</span>";

    
    html += "<span class='main-row-float'>";
    html += "<em>종료</em>";
    html += "<input type='month' name='eMonth' class='eMonth'/>";
    html += "</span>";

    html += "<span class='main-row-float'>";
    html += "<span class='btnCheck commonBtn'><input type='button' name='search' value='조회' class='monthSearch'/></span>";
    html += "</span>";
  
    html += "</div>";
    html += "</div>";
    
    html += "<br />";
    html += "<div class='moneybook-main'>";
    html += "<div class='moneybook-list list-second'></div>";
    html += "</div>";
    html += "</div>";
    $(".content").html("").append(html);

    // date 클래스에 해당 달의 첫번째 날짜를 기본 값으로 설정
    var strDate = d.getFullYear() + "-" + (d.getMonth()+1);
    $(".sMonth").val(strDate);
    $(".eMonth").val(strDate);
    
    selectCardList(strDate, strDate);
    
    searchAction();
  });
  
  
  
  $(".btnGraph1").on('click', function() {
    var html = "";
    var d = new Date();
    html += "<div class='moneybook-main'>";
    html += "<div class='main-row-1st'>";
    html += "<span class='main-row-float'>";
    html += "<em>시작일</em>";
    html += "<input type='date' name='sDate' class='sDate'/>";
    html += "<strong>~</strong>";
    html += "</span>";

    
    html += "<span class='main-row-float'>";
    html += "<em>종료일</em>";
    html += "<input type='date' name='eDate' class='eDate'/>";
    html += "</span>";

    html += "<span class='main-row-float'>";
    html += "<span class='btnCheck commonBtn'><input type='button' name='search' value='조회' onclick='spendSearch()' class='spendSearch'/></span>";
    html += "</span>";
    html += "</div>";
    html += "</div>";
    html += "<br />";
    
    html += "<div class='moneybook-main'>";
    html += "<div class='moneybook-list-graph'>";
    html += "<div id='dashboard'>";
    html += "</div>";
    html += "</div>";
    html += "</div>";
    $(".content").html("").append(html);

    // date 클래스에 해당 달의 첫번째 날짜를 기본 값으로 설정
    var strDate = d.getFullYear() + "-" + (d.getMonth()+1) + "-" + "01";
    $(".sDate").val(strDate);

    // date 클래스에 해당 달의 마지막 날짜를 기본 값으로 설정
    var lastDay = new Date(d.getFullYear(), d.getMonth() + 1, 0);
    var lastDayWithSlashes =  lastDay.getFullYear() + '-' + (lastDay.getMonth() + 1) + "-" +(lastDay.getDate());
    $(".eDate").val(lastDayWithSlashes);
    
    spendChart(strDate, lastDayWithSlashes);

    
    function spendSearch() {
      spendChart($(".sDate").val(strDate), $(".eDate").val(lastDayWithSlashes));
    }
  
  });
  

  $(".btnGraph2").on('click', function() {
    var html = "";
    var d = new Date();
    html += "<div class='moneybook-main'>";
    html += "<div class='main-row-3rd'>";
    html += "<select class='year' onchange='yeardChart()'>";
    html += "<option>연도별</option>";
    html += "<option val='"+(d.getFullYear()-4)+"'>"+(d.getFullYear()-4)+"</option>";
    html += "<option val='"+(d.getFullYear()-3)+"'>"+(d.getFullYear()-3)+"</option>";
    html += "<option val='"+(d.getFullYear()-2)+"'>"+(d.getFullYear()-2)+"</option>";
    html += "<option val='"+(d.getFullYear()-1)+"'>"+(d.getFullYear()-1)+"</option>";
    html += "<option val='"+(d.getFullYear()-0)+"'>"+(d.getFullYear()-0)+"</option>";
    html += "<option val='"+(d.getFullYear()+1)+"'>"+(d.getFullYear()+1)+"</option>";
    html += "<option val='"+(d.getFullYear()+2)+"'>"+(d.getFullYear()+2)+"</option>";
    html += "</select>";
    html += "</div>";
    html += "</div>";
    html += "<br />";
    html += "<div class='moneybook-main'>";
    html += "<div class='moneybook-list-graph'></div>";
    html += "</div>";
    
    
    $(".content").html("").append(html);
    
    drawYearLineChart(d.getFullYear());
    
  });
  
  
  
  $(".btnGraph3").on('click', function() {
    var value = [];
    var cnt = 0;
    var html = "";
    var d = new Date();
    html += "<div class='moneybook-main'>";
    html += "<div class='main-row-1st'>";
    html += "<span class='main-row-float'>";
    html += "<em>시작일</em>";
    html += "<input type='date' name='sDate' class='sDate'/>";
    html += "<strong>~</strong>";
    html += "</span>";
    
    html += "<span class='main-row-float'>";
    html += "<em>종료일</em>";
    html += "<input type='date' name='eDate' class='eDate'/>";
    html += "</span>";

    html += "<span class='main-row-float'>";
    html += "<span class='btnCheck commonBtn'><input type='button' name='search' value='조회' class='btn_search'/></span>";
    html += "</span>";
    html += "</div>";
    html += "</div>";
    html += "<br />";
   
    html += "<div class='moneybook-main'>";
    html += "<div class='moneybook-list-graph3'></div>";
    html += "</div>";
    $(".content").html("").append(html);

    // date 클래스에 해당 달의 첫번째 날짜를 기본 값으로 설정
    var strDate = d.getFullYear() + "-" + (d.getMonth()+1) + "-" + "01";
    $(".sDate").val(strDate);

    // date 클래스에 해당 달의 마지막 날짜를 기본 값으로 설정
    var lastDay = new Date(d.getFullYear(), d.getMonth() + 1, 0);
    var lastDayWithSlashes =  lastDay.getFullYear() + '-' + (lastDay.getMonth() + 1) + "-" +(lastDay.getDate());
    $(".eDate").val(lastDayWithSlashes);
    
    
    

    var value = [];

    
    function sortGraph3(strDate, lastDayWithSlashes) {
      value = [];
      $.ajax({
        url : "/WithProject/moneybook/sortSearchMoneybook.json?start="+strDate+"&end="+lastDayWithSlashes,
        async : false
      })
      .done(function(response) {
        console.log(response);
        $.each(response, function(index, MoneybookVO) { 
          value.push(response[index].mMoney);
      })
      console.log(value);
        cnt=0;
    })
    }
    
    
    sortGraph3(strDate, lastDayWithSlashes);
    
    var svg = d3.select(".moneybook-list-graph3")
    .append("svg")
    .append("g")

  svg.append("g")
    .attr("class", "slices");
  svg.append("g")
    .attr("class", "labels");
  svg.append("g")
    .attr("class", "lines");

  var width = 960,
      height = 450,
    radius = Math.min(width, height) / 2;

  var pie = d3.layout.pie()
    .sort(null)
    .value(function(d) {
      return d.value;
    });

  var arc = d3.svg.arc()
    .outerRadius(radius * 0.8)
    .innerRadius(radius * 0.4);

  var outerArc = d3.svg.arc()
    .innerRadius(radius * 0.9)
    .outerRadius(radius * 0.9);

  svg.attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

  var key = function(d){ return d.data.label; };

  var color = d3.scale.ordinal()
    .domain(["회비", "이자", "기타 수입", "미분류"])
    .range(["#98abc5", "#8a89a6", "#7b6888", "#6b486b", "#a05d56", "#d0743c", "#ff8c00"]);

  change(randomData());

  d3.select(".btn_search").on("click", function(){
    var start = $(".sDate").val();
    var end = $(".eDate").val();
    console.log("!!");
    sortGraph3(start, end);
    change(randomData());
  });

  function randomData (){
    var labels = color.domain();
    return labels.map(function(label){
      return { label: label, value: value[cnt++]}
    });
  }

  function change(data) {
    /* ------- PIE SLICES -------*/
    var slice = svg.select(".slices").selectAll("path.slice")
      .data(pie(data), key);

    slice.enter()
      .insert("path")
      .style("fill", function(d) { return color(d.data.label); })
      .attr("class", "slice");

    slice   
      .transition().duration(1000)
      .attrTween("d", function(d) {
        this._current = this._current || d;
        var interpolate = d3.interpolate(this._current, d);
        this._current = interpolate(0);
        return function(t) {
          return arc(interpolate(t));
        };
      })

    slice.exit()
      .remove();

    /* ------- TEXT LABELS -------*/

    var text = svg.select(".labels").selectAll("text")
      .data(pie(data), key);

    text.enter()
      .append("text")
      .attr("dy", ".35em")
      .text(function(d) {
        return d.data.label;
      });
    
    function midAngle(d){
      return d.startAngle + (d.endAngle - d.startAngle)/2;
    }

    text.transition().duration(1000)
      .attrTween("transform", function(d) {
        this._current = this._current || d;
        var interpolate = d3.interpolate(this._current, d);
        this._current = interpolate(0);
        return function(t) {
          var d2 = interpolate(t);
          var pos = outerArc.centroid(d2);
          pos[0] = radius * (midAngle(d2) < Math.PI ? 1 : -1);
          return "translate("+ pos +")";
        };
      })
      .styleTween("text-anchor", function(d){
        this._current = this._current || d;
        var interpolate = d3.interpolate(this._current, d);
        this._current = interpolate(0);
        return function(t) {
          var d2 = interpolate(t);
          return midAngle(d2) < Math.PI ? "start":"end";
        };
      });

    text.exit()
      .remove();

    /* ------- SLICE TO TEXT POLYLINES -------*/

    var polyline = svg.select(".lines").selectAll("polyline")
      .data(pie(data), key);
    
    polyline.enter()
      .append("polyline");

    polyline.transition().duration(1000)
      .attrTween("points", function(d){
        this._current = this._current || d;
        var interpolate = d3.interpolate(this._current, d);
        this._current = interpolate(0);
        return function(t) {
          var d2 = interpolate(t);
          var pos = outerArc.centroid(d2);
          pos[0] = radius * 0.95 * (midAngle(d2) < Math.PI ? 1 : -1);
          return [arc.centroid(d2), outerArc.centroid(d2), pos];
        };      
      });
    
    polyline.exit()
      .remove();
  };
    
    
  }); 
});


  function selectCardList(start, end) {
    var arr1 = start.split('-');
    var arr2 = end.split('-');
    
    var start = (Number(arr1[0]*12) + Number(arr1[1]));
    var end = (Number(arr2[0]*12) + Number(arr2[1]));
    
    var month;
    var year;
    var lastDay;
    var lastDayWithSlashes;
    $(".moneybook-list").empty();
    for(var i=0; i<=end-start; i++) {
      year = (Math.floor((Number(arr1[0]*12) + Number(arr1[1])+i)/12));
      month = ((Number(arr1[0]*12) + Number(arr1[1])+i)%12);
      lastDay = new Date(year, month + 1, 0);
      lastDayWithSlashes = (lastDay.getFullYear()) + "-" + (lastDay.getMonth()) + "-" + (lastDay.getDate());
      
      if(month == 0) {
        year = year-1;
        month = 12;
      }
      console.log(year+"-"+month);
      $.ajax({
        url : "/WithProject/moneybook/select_CardList.json?date="+year+"-"+month
      })
      .done(function(data) {
        var html = "";
        html += "<div class='list-second-inner'>";
          html += "<p>"+data.mDate+"</p>"
            html += "<table>";
               html += "<colgroup>";
                 html += "<col style='width:20%' />"
                 html += "<col style='width:30%' />"
                 html += "<col style='width:50%' />"
               html += "</colgroup>";
               html += "<thead>";
                 html += "<tr>";
                   html += "<th><div>항목</div></th>";
                   html += "<th><div>청구금액</div></th>";
                   html += "<th><div>사용기간</div></th>";
                 html += "</tr>";
               html += "</thead>";
               html += "<tbody>";
               html += "<tr>";
                 html += "<td class='total'>총 금액</td>";
                   html += "<td class='use-money'>"+data.mMoney+"</td>";
                 html += "<td>"+year+"-"+month+"-"+01+"~"+lastDayWithSlashes+"</td>";
               html += "</tr>";
               html += "</tbody>";
            html += "</table>";
        html += "</div>";
        $(".moneybook-list").append(html);
      })
    }
  }
  
  function selectMoneyList(start, end) {
    var arr1 = start.split('-');
    var arr2 = end.split('-');
    
    var start = (Number(arr1[0]*12) + Number(arr1[1]));
    var end = (Number(arr2[0]*12) + Number(arr2[1]));
    
    var month;
    var year;
    var lastDay;
    var lastDayWithSlashes;
    $(".moneybook-list").empty();
    for(var i=0; i<=end-start; i++) {
      year = (Math.floor((Number(arr1[0]*12) + Number(arr1[1])+i)/12));
      month = ((Number(arr1[0]*12) + Number(arr1[1])+i)%12);
      lastDay = new Date(year, month + 1, 0);
      lastDayWithSlashes = (lastDay.getFullYear()) + "-" + (lastDay.getMonth()) + "-" + (lastDay.getDate());
      
      if(month == 0) {
        year = year-1;
        month = 12;
      }
      console.log(year+"-"+month);
      $.ajax({
        url : "/WithProject/moneybook/select_MoneyList.json?date="+year+"-"+month
      })
      .done(function(data) {
        var html = "";
        html += "<div class='list-second-inner'>";
          html += "<p>"+data.mDate+"</p>"
            html += "<table>";
               html += "<colgroup>";
                 html += "<col style='width:20%' />"
                 html += "<col style='width:30%' />"
                 html += "<col style='width:50%' />"
               html += "</colgroup>";
               html += "<thead>";
                 html += "<tr>";
                   html += "<th><div>항목</div></th>";
                   html += "<th><div>사용금액</div></th>";
                   html += "<th><div>사용기간</div></th>";
                 html += "</tr>";
               html += "</thead>";
               html += "<tbody>";
                 html += "<tr>";
                   html += "<td class='total'>총 금액</td>";
                     html += "<td class='use-money'>"+data.mMoney+"</td>";
                   html += "<td>"+year+"-"+month+"-"+01+"~"+lastDayWithSlashes+"</td>";
                 html += "</tr>";
               html += "</tbody>";
            html += "</table>";
        html += "</div>";
        $(".moneybook-list").append(html);
      })
    }
  }

  function selectMainListOption(start, end) {
    var total = 0;
    $.ajax({
      url : "/WithProject/moneybook/select_moneybookOption.json?start="+start+"&end="+end
    })
     .done(function(data) {
      var html = "";
      $.each(data, function(index, MoneybookVO) { 
        html += "<li id='moneybook_"+data[index].mNo+"' class='moneybook-item'>";
        html += "<div class='item-date'><span>"+data[index].mDate+"</span></div>";
        html += "<div class='item_writer'><span>"+data[index].memberNo+"</span></div>";
        html += "<div class='item-memo'><span>"+data[index].mMemo+"</span></div>";
        if(data[index].mType != 3) {
          total = total + data[index].mMoney;
          html += "<div class='item-total'><span>"+total+"</span></div>";
        }
        else {
          html += "<div class='item-total'><span>"+total+"</span></div>";
        }
        html += "<div class='item-money'><span>"+data[index].mMoney+"</span></div>";
        html += "<div class='item-spend'><span>"+data[index].mLeft+"</span></div>";
        html += "<div class='item-import'><span>"+data[index].mRight+"</span></div>";
        html += "<div class='item-menu'>";
          html += "<span class='menu-span'>";
            html += "<button class='btnModify commonBtn' id='btnModify' onclick='modifyMoneybook("+data[index].mNo+");'>수정</button>";
            html += "<button class='btnDelete commonBtn' id='btnDelete' onclick='deleteMoneybook("+data[index].mNo+");'>삭제</button>";
          html +="</span>";
        html += "</div>";
        
        html += "</li>";
      })
      $(".moneybook-list").html("").append(html);
      menuShow();
    })
  }

  function changeQuarter() {
    
  }

  function changeMonth() {
    var start = d.getFullYear() + "-" + $(".month").val() +"-01";
    var end =  d.getFullYear() + "-" + $(".month").val() +"-31";
    selectMainListOption(start, end);
  }

  function changeYear() {
    var start = $(".year").val()+"-01-01";
    var end = $(".year").val()+"-12-31";
    selectMainListOption(start, end);
  }



  // quick 머니를 통해 금액을 늘리는 부분
  function quickMoney(money) {
    // 클릭한 금액이 0보다 클 경우 +
    if(money > 0) {
      $(".money").val(Number($(".money").val())+Number(money));
    }
    
    // 클릭한 금액이 0보다 작을 경우 -
    else if(money < 0) {
      money = String(money).replace("-", "");
      $(".money").val(Number($(".money").val())-Number(money));
    }
    
    // 클릭한 금액이 0일 경우 초기화
    else if(money == 0) {
      $(".money").val(0);
    }
  }
  
  // 가계부 내역 메뉴 hide, show 부분
  function menuShow() {
    // 마우스 over시 수정삭제 리모컨 디스플레이 show
    $(".item-menu").on('mouseover', function() {
      $(this).find('span').show();
    });
    
    // 마우스 leave시 수정삭제 리모컨 디스플레이 hide
    $(".item-menu").on('mouseleave', function() {
      $(this).find('span').hide();
    });

  }

  // 하단 거래 내역을 출력하는 부분
  function selectMainList() {
    $.ajax({
      url: "/WithProject/moneybook/select_moneybook.json"
    })
    .done(function(data) {
      var html = "";
      $.each(data, function(index, MoneybookVO) { 
        html += "<li id='moneybook_"+data[index].mNo+"' class='moneybook-item'>";
        html += "<div class='item-date'><span>"+data[index].mDate+"</span></div>";
        html += "<div class='item_writer'><span>"+data[index].memberNo+"</span></div>";
        html += "<div class='item-memo'><span>"+data[index].mMemo+"</span></div>";
        html += "<div class='item-money'><span>"+data[index].mMoney+"</span></div>";
        html += "<div class='item-spend'><span>"+data[index].mLeft+"</span></div>";
        html += "<div class='item-import'><span>"+data[index].mRight+"</span></div>";
        html += "<div class='item-menu'>";
          html += "<span class='menu-span'>";
            html += "<button class='btnModify commonBtn' id='btnModify' onclick='modifyMoneybook("+data[index].mNo+");'>수정</button>";
            html += "<button class='btnDelete commonBtn' id='btnDelete' onclick='deleteMoneybook("+data[index].mNo+");'>삭제</button>";
          html +="</span>";
        html += "</div>";
        
        html += "</li>";
      })
      $(".moneybook-list").append(html);
      menuShow();
    })
  }
  
  // 가계부 등록을 위한 function
  function regMoney() {
    var left = $(".left").val();
    var right = $(".right").val();
    if((left==3 && right==2) || (left==3 && right==1) || (left==2 && right==1)) {
      $(".mType").val(1);
    }
    else if(left==1 && right==3) {
      $(".mType").val(2);
    }
    else {
      $(".mType").val(3);
    }
    $.ajax({
      url: "/WithProject/moneybook/reg_moneybook.json",
      data : $("#moneybookForm").serialize()
    })
    .done(function(data) {
      var html = "";
      html += "<li id='moneybook_"+data.mNo+"' class='moneybook-item'>";
        html += "<div class='item-date'><span>"+data.mDate+"</span></div>";
        html += "<div class='item_writer'><span>"+data.memberNo+"</span></div>";
        html += "<div class='item-memo'><span>"+data.mMemo+"</span></div>";
        html += "<div class='item-money'><span>"+data.mMoney+"</span></div>";
        html += "<div class='item-spend'><span>"+data.mLeft+"</span></div>";
        html += "<div class='item-import'><span>"+data.mRight+"</span></div>";
        html += "<div class='item-menu'>";
        html += "<span class='menu-span'>";
          html += "<button class='btnModify commonBtn' onclick='modifyMoneybook("+data.mNo+");' id='btnModify'>수정</button>";
          html += "<button class='btnDelete commonBtn' onclick='deleteMoneybook("+data.mNo+");' id='btnDelete'>삭제</button>";
        html +="</span>";
      html += "</div>";
      html += "</li>";
      $(".moneybook-list").prepend(html);
      menuShow();
    })
  }
  
  // 가계부 내역 수정
  function modifyMoneybook(no) {
    $('.modifyDIV').css("top", Math.max(0, (($(window).height() - $('.modifyDIV').outerHeight()) / 2) + 
        $(window).scrollTop()) + "px");
    $('.modifyDIV').css("left", Math.max(0, (($(window).width() - $('.modifyDIV').outerWidth()) / 2) + 
        $(window).scrollLeft()) + "px");
    $('.modifyDIV').css("z-index", "99999");
    $('body').toggleClass("dark");
    
    $('.modifyDIV').toggle();
  }
  
  // 가계부 내역 삭제
  function deleteMoneybook(no) {
    $.ajax({
      url: "/WithProject/moneybook/delete_moneybook.json?no="+no
    })
    .done(function() {
      $("#moneybook_"+no).remove();
    })
  }

  function searchAction() {
    $(".monthSearch").on('click', function() {
      var start = $(".sMonth").val();
      var end = $(".eMonth").val();
      selectCardList(start, end);
    })
  }
  
  function searchMoneyAction() {
    $(".monthSearch").on('click', function() {
      var start = $(".sMonth").val();
      var end = $(".eMonth").val();
      selectMoneyList(start, end);
    })
  }
  function spendChart(start, end) {
    freqData = [];
    $("#dashboard").empty();
        $.ajax({
          url : "/WithProject/moneybook/spendChart.json?start="+start+"&end="+end
        })
        .done(function(response) {
          freqData = [{State:'식비',freq:{신용카드:response.card[0], 체크카드:response.check[0], 현금:response.money[0], 갚을돈:response.debt[0]}}
          ,{State:'교통비',freq:{신용카드:response.card[1], 체크카드:response.check[1], 현금:response.money[1], 갚을돈:response.debt[1]}}
          ,{State:'생활용품',freq:{신용카드:response.card[2], 체크카드:response.check[2], 현금:response.money[2], 갚을돈:response.debt[2]}}
          ,{State:'교통/차량',freq:{신용카드:response.card[3], 체크카드:response.check[3], 현금:response.money[3], 갚을돈:response.debt[3]}}
          ,{State:'경조사',freq:{신용카드:response.card[4], 체크카드:response.check[4], 현금:response.money[4], 갚을돈:response.debt[4]}}
          ,{State:'장소대여비',freq:{신용카드:response.card[5], 체크카드:response.check[5], 현금:response.money[5], 갚을돈:response.debt[5]}}
          ,{State:'미분류',freq:{신용카드:response.card[6], 체크카드:response.check[6], 현금:response.money[6], 갚을돈:response.debt[6]}}];
          dashboard('#dashboard',freqData);
        });
     }
  
  
  function drawYearLineChart(year) {
    var margin = {top: 20, right: 20, bottom: 30, left: 50},
        width = 960 - margin.left - margin.right,
        height = 500 - margin.top - margin.bottom;

    var parseDate = d3.time.format("%Y%m").parse;

    var x = d3.time.scale()
        .range([0, width]);

    var y = d3.scale.linear()
        .range([height, 0]);

    var xAxis = d3.svg.axis()
        .scale(x)
        .orient("bottom");

    var yAxis = d3.svg.axis()
        .scale(y)
        .orient("left");

    var line = d3.svg.area()
        .interpolate("basis")
        .x(function(d) { return x(d.date); })
        .y(function(d) { return y(d["수입"]); });

    var area = d3.svg.area()
        .interpolate("basis")
        .x(function(d) { return x(d.date); })
        .y1(function(d) { return y(d["수입"]); });

    var svg = d3.select(".moneybook-list-graph").html("").append("svg")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
      .append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    var data = [];
    $.ajax({
      url:"/WithProject/moneybook/selectYearChart.json?year="+year
    })
    .done(function(response) {
      console.log(response[0])
        data = [{date:(year+"01").toString(), '수입': Number(response[0].money), '지출': Number(response[1].money)},
                {date:(year+"02").toString(), '수입': Number(response[2].money), '지출': Number(response[3].money)},
                {date:(year+"03").toString(), '수입': Number(response[4].money), '지출': Number(response[5].money)},
                {date:(year+"04").toString(), '수입': Number(response[6].money), '지출': Number(response[7].money)},
                {date:(year+"05").toString(), '수입': Number(response[8].money), '지출': Number(response[9].money)},
                {date:(year+"06").toString(), '수입': Number(response[10].money), '지출': Number(response[11].money)},
                {date:(year+"07").toString(), '수입': Number(response[12].money), '지출': Number(response[13].money)},
                {date:(year+"08").toString(), '수입': Number(response[14].money), '지출': Number(response[15].money)},
                {date:(year+"09").toString(), '수입': Number(response[16].money), '지출': Number(response[17].money)},
                {date:(year+"10").toString(), '수입': Number(response[18].money), '지출': Number(response[19].money)},
                {date:(year+"11").toString(), '수입': Number(response[20].money), '지출': Number(response[21].money)},
                {date:(year+"12").toString(), '수입': Number(response[22].money), '지출': Number(response[23].money)}
                ];
//        data = [{date:'201101', '수입':63.4, '지출':62.7},
//                {date:'201102', '수입':58.0, '지출':59.9},
//                {date:'201103', '수입':53.0, '지출':54.9},
//                {date:'201104', '수입':55.7, '지출':64.1},
//                {date:'201105', '수입':64.2, '지출':60.7},
//                {date:'201106', '수입':57.9, '지출':65.1},
//                {date:'201107', '수입':71.2, '지출':54.4},
//                {date:'201108', '수입':61.8, '지출':58.1}];
//                console.log(response);
        data.forEach(function(d) {
          d.date = parseDate(d.date);
          d["수입"]= +d["수입"];
          d["지출"] = +d["지출"];
        });
        
        x.domain(d3.extent(data, function(d) { return d.date; }));
        
        y.domain([
                  d3.min(data, function(d) { return Math.min(d["수입"], d["지출"]); }),
                  d3.max(data, function(d) { return Math.max(d["수입"], d["지출"]); })
                  ]);
        
        svg.datum(data);
        
        svg.append("clipPath")
        .attr("id", "clip-below")
        .append("path")
        .attr("d", area.y0(height));
        
        svg.append("clipPath")
        .attr("id", "clip-above")
        .append("path")
        .attr("d", area.y0(0));
        
        svg.append("path")
        .attr("class", "area above")
        .attr("clip-path", "url(#clip-above)")
        .attr("d", area.y0(function(d) { return y(d["지출"]); }));
        
        svg.append("path")
        .attr("class", "area below")
        .attr("clip-path", "url(#clip-below)")
        .attr("d", area);
        
        svg.append("path")
        .attr("class", "line")
        .attr("d", line);
        
        svg.append("g")
        .attr("class", "x axis")
        .attr("transform", "translate(0," + height + ")")
        .call(xAxis);
        
        svg.append("g")
        .attr("class", "y axis")
        .call(yAxis)
        .append("text")
        .attr("transform", "rotate(-90)")
        .attr("y", 6)
        .attr("dy", ".71em")
        .style("text-anchor", "end")
        .text("지출대비 수입비율(%)");
    })
  }  

  function yeardChart() {
    var year = $(".year").val();
    drawYearLineChart(year);
  }