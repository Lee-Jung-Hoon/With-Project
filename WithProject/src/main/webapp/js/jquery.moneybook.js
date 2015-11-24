/**
 * 가계부 관련 jQuery
 */

var cnt = 0;
var value = [1,2,3,4,5,6,7];
$(document).ready(function() {  
  $(".btnInsert").on('click', function() {
    var html = "";
    html += "<form id='moneybookForm'>";
    html += "<div class='moneybook-main'>";
    html += "<div class='main-row'>";
    html += "<div>날짜</div>";
    html += "<input type='date' name='mDate' class='date'/>";
    html += "</div>";
    html += "<div class='main-row'>";
    html += "<div>메모</div>";
    html += "<input type='text' name='mMemo' id='memo' class='memo' value=''/>";
    html += "</div>";
    html += "<div class='main-row'>";
    html += "<div>금액</div>";
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
    html += " <div class='main-row-spend'>";
    html += "<div>지출</div>";
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
   
    html += "<div class='main-row-import'>";
    html += "<div>수입</div>";
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
    html += "<div class='main-row'>";
    html += "<input type='button' class='reg-btn' value='입력' onclick='regMoney();'>";
    html += "</div>";
    html += "</div>";
    html += "<input type='hidden' name='mType' id='mType' class='mType'/>"
    html += "</form>";
    
    html += "<input type='hidden' name='left' class='left'/>"
    html += "<input type='hidden' name='right' class='right'/>"
    html += "<div class='moneybook-main'>";
    html += "<div class='moneybook-list'>";
    html += "</div>";
    html += "</div>";
    
    $(".container").html("").append(html);

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
    html += "<div class='main-row'>";
    html += "<div>시작일</div>";
    html += "<input type='date' name='sDate' class='sDate'/>";
    html += "</div>";

    html += "<div class='main-row'>";
    html += "<br/>";
    html += "<div>~</div>";
    html += "</div>";
    
    html += "<div class='main-row'>";
    html += "<div>종료일</div>";
    html += "<input type='date' name='eDate' class='eDate'/>";
    html += "</div>";

    html += "<div class='main-row'>";
    html += "<br/>";
    html += "<input type='button' name='btn' value='조회' class='btn'/>";
    html += "</div>";
    
    html += "<div class='main-row' style='float:right;'>";
    html += "<br/>";
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
    html += "</div>";

    html += "<div class='main-row' style='float:right;'>";
    html += "<br/>";
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
    html += "</div>";

    html += "<div class='main-row' style='float:right;'>";
    html += "<br/>";
    html += "<select class='month' onchange='changeMonth()'>";
    html += "<option>월별</option>";
    for(var i=1; i<=12; i++)
      html+="<option value='"+i+"'>"+i+"월</option>";
    html += "</select>";
    html += "</div>";
    
    html += "<div style='clear:both; height:20px;'></div>";
    html += "<div class='moneybook-list'>";
    html += "</div>";
    html += "</div>";
    html += "</div>";
    $(".container").html("").append(html);

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
    html += "<div class='main-row'>";
    html += "<div>시작일</div>";
    html += "<input type='date' name='sDate' class='sDate'/>";
    html += "</div>";

    html += "<div class='main-row'>";
    html += "<br/>";
    html += "<div>~</div>";
    html += "</div>";
    
    html += "<div class='main-row'>";
    html += "<div>종료일</div>";
    html += "<input type='date' name='eDate' class='eDate'/>";
    html += "</div>";

    html += "<div class='main-row'>";
    html += "<br/>";
    html += "<input type='button' name='btn' value='조회' class='btn'/>";
    html += "</div>";
    
    html += "<div class='main-row' style='float:right;'>";
    html += "<br/>";
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
    html += "</div>";

    html += "<div class='main-row' style='float:right;'>";
    html += "<br/>";
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
    html += "</div>";

    html += "<div class='main-row' style='float:right;'>";
    html += "<br/>";
    html += "<select class='month' onchange='changeMonth()'>";
    html += "<option>월별</option>";
    for(var i=1; i<=12; i++)
      html+="<option value='"+i+"'>"+i+"월</option>";
    html += "</select>";
    html += "</div>";
    
    html += "<div style='clear:both; height:20px;'></div>";
    html += "<div class='moneybook-list'>";
    html += "</div>";
    html += "</div>";
    html += "</div>";
    $(".container").html("").append(html);

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
    
  });  

  $(".btnCard").on('click', function() {
    var html = "";
    var d = new Date();
    html += "<div class='moneybook-main'>";
    html += "<div class='main-row'>";
    html += "<div>시작</div>";
    html += "<input type='month' name='sMonth' class='sMonth'/>";
    html += "</div>";

    html += "<div class='main-row'>";
    html += "<br/>";
    html += "<div>~</div>";
    html += "</div>";
    
    html += "<div class='main-row'>";
    html += "<div>종료</div>";
    html += "<input type='month' name='eMonth' class='eMonth'/>";
    html += "</div>";

    html += "<div class='main-row'>";
    html += "<br/>";
    html += "<input type='button' name='search' value='조회' class='monthSearch'/>";
    html += "</div>";
  
    html += "<div style='clear:both; height:20px;'></div>";
    html += "<div class='moneybook-list'>";
    html += "</div>";
    html += "</div>";
    html += "</div>";
    $(".container").html("").append(html);

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
    html += "<div class='main-row'>";
    html += "<div>시작일</div>";
    html += "<input type='date' name='sDate' class='sDate'/>";
    html += "</div>";

    html += "<div class='main-row'>";
    html += "<br/>";
    html += "<div>~</div>";
    html += "</div>";
    
    html += "<div class='main-row'>";
    html += "<div>종료일</div>";
    html += "<input type='date' name='eDate' class='eDate'/>";
    html += "</div>";

    html += "<div class='main-row'>";
    html += "<br/>";
    html += "<input type='button' name='search' value='조회' class='search'/>";
    html += "</div>";
    
    html += "<div class='main-row' style='float:right;'>";
    html += "<br/>";
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
    html += "</div>";

    html += "<div class='main-row' style='float:right;'>";
    html += "<br/>";
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
    html += "</div>";

    html += "<div class='main-row' style='float:right;'>";
    html += "<br/>";
    html += "<select class='month' onchange='changeMonth()'>";
    html += "<option>월별</option>";
    for(var i=1; i<=12; i++)
      html+="<option value='"+i+"'>"+i+"월</option>";
    html += "</select>";
    html += "</div>";
    
    html += "<div style='clear:both; height:20px;'></div>";
    html += "<div class='moneybook-list-graph'>";
    html += "<div id='dashboard'>";
    html += "</div>";
    html += "</div>";
    html += "</div>";
    $(".container").html("").append(html);

    // date 클래스에 해당 달의 첫번째 날짜를 기본 값으로 설정
    var strDate = d.getFullYear() + "-" + (d.getMonth()+1) + "-" + "01";
    $(".sDate").val(strDate);

    // date 클래스에 해당 달의 마지막 날짜를 기본 값으로 설정
    var lastDay = new Date(d.getFullYear(), d.getMonth() + 1, 0);
    var lastDayWithSlashes =  lastDay.getFullYear() + '-' + (lastDay.getMonth() + 1) + "-" +(lastDay.getDate());
    $(".eDate").val(lastDayWithSlashes);
    

    function dashboard(id, fData){
        var barColor = 'steelblue';
        function segColor(c){ return {신용카드:"#807dba", 현금:"#e08214", 체크카드:"#FF4848", 갚을돈:"#41ab5d"}[c]; }
        
        // compute total for each state.
        fData.forEach(function(d){d.total=d.freq.신용카드+d.freq.현금+d.freq.갚을돈+d.freq.체크카드;});
        
        // function to handle histogram.
        function histoGram(fD){
            var hG={},    hGDim = {t: 60, r: 0, b: 30, l: 0};
            hGDim.w = 500 - hGDim.l - hGDim.r, 
            hGDim.h = 300 - hGDim.t - hGDim.b;
                
            //create svg for histogram.
            var hGsvg = d3.select(id).append("svg")
                .attr("width", hGDim.w + hGDim.l + hGDim.r)
                .attr("height", hGDim.h + hGDim.t + hGDim.b).append("g")
                .attr("transform", "translate(" + hGDim.l + "," + hGDim.t + ")");

            // create function for x-axis mapping.
            var x = d3.scale.ordinal().rangeRoundBands([0, hGDim.w], 0.1)
                    .domain(fD.map(function(d) { return d[0]; }));

            // Add x-axis to the histogram svg.
            hGsvg.append("g").attr("class", "x axis")
                .attr("transform", "translate(0," + hGDim.h + ")")
                .call(d3.svg.axis().scale(x).orient("bottom"));

            // Create function for y-axis map.
            var y = d3.scale.linear().range([hGDim.h, 0])
                    .domain([0, d3.max(fD, function(d) { return d[1]; })]);

            // Create bars for histogram to contain rectangles and freq labels.
            var bars = hGsvg.selectAll(".bar").data(fD).enter()
                    .append("g").attr("class", "bar");
            
            //create the rectangles.
            bars.append("rect")
                .attr("x", function(d) { return x(d[0]); })
                .attr("y", function(d) { return y(d[1]); })
                .attr("width", x.rangeBand())
                .attr("height", function(d) { return hGDim.h - y(d[1]); })
                .attr('fill',barColor)
                .on("mouseover",mouseover)// mouseover is defined below.
                .on("mouseout",mouseout);// mouseout is defined below.
                
            //Create the frequency labels above the rectangles.
            bars.append("text").text(function(d){ return d3.format(",")(d[1])})
                .attr("x", function(d) { return x(d[0])+x.rangeBand()/2; })
                .attr("y", function(d) { return y(d[1])-5; })
                .attr("text-anchor", "middle");
            
            function mouseover(d){  // utility function to be called on mouseover.
                // filter for selected state.
                var st = fData.filter(function(s){ return s.State == d[0];})[0],
                    nD = d3.keys(st.freq).map(function(s){ return {type:s, freq:st.freq[s]};});
                   
                // call update functions of pie-chart and legend.    
                pC.update(nD);
                leg.update(nD);
            }
            
            function mouseout(d){    // utility function to be called on mouseout.
                // reset the pie-chart and legend.    
                pC.update(tF);
                leg.update(tF);
            }
            
            // create function to update the bars. This will be used by pie-chart.
            hG.update = function(nD, color){
                // update the domain of the y-axis map to reflect change in frequencies.
                y.domain([0, d3.max(nD, function(d) { return d[1]; })]);
                
                // Attach the new data to the bars.
                var bars = hGsvg.selectAll(".bar").data(nD);
                
                // transition the height and color of rectangles.
                bars.select("rect").transition().duration(500)
                    .attr("y", function(d) {return y(d[1]); })
                    .attr("height", function(d) { return hGDim.h - y(d[1]); })
                    .attr("fill", color);

                // transition the frequency labels location and change value.
                bars.select("text").transition().duration(500)
                    .text(function(d){ return d3.format(",")(d[1])})
                    .attr("y", function(d) {return y(d[1])-5; });            
            }        
            return hG;
        }
        
        // function to handle pieChart.
        function pieChart(pD){
            var pC ={},    pieDim ={w:250, h: 250};
            pieDim.r = Math.min(pieDim.w, pieDim.h) / 2;
                    
            // create svg for pie chart.
            var piesvg = d3.select(id).append("svg")
                .attr("width", pieDim.w).attr("height", pieDim.h).append("g")
                .attr("transform", "translate("+pieDim.w/2+","+pieDim.h/2+")");
            
            // create function to draw the arcs of the pie slices.
            var arc = d3.svg.arc().outerRadius(pieDim.r - 10).innerRadius(0);

            // create a function to compute the pie slice angles.
            var pie = d3.layout.pie().sort(null).value(function(d) { return d.freq; });

            // Draw the pie slices.
            piesvg.selectAll("path").data(pie(pD)).enter().append("path").attr("d", arc)
                .each(function(d) { this._current = d; })
                .style("fill", function(d) { return segColor(d.data.type); })
                .on("mouseover",mouseover).on("mouseout",mouseout);

            // create function to update pie-chart. This will be used by histogram.
            pC.update = function(nD){
                piesvg.selectAll("path").data(pie(nD)).transition().duration(500)
                    .attrTween("d", arcTween);
            }        
            // Utility function to be called on mouseover a pie slice.
            function mouseover(d){
                // call the update function of histogram with new data.
                hG.update(fData.map(function(v){ 
                    return [v.State,v.freq[d.data.type]];}),segColor(d.data.type));
            }
            //Utility function to be called on mouseout a pie slice.
            function mouseout(d){
                // call the update function of histogram with all data.
                hG.update(fData.map(function(v){
                    return [v.State,v.total];}), barColor);
            }
            // Animating the pie-slice requiring a custom function which specifies
            // how the intermediate paths should be drawn.
            function arcTween(a) {
                var i = d3.interpolate(this._current, a);
                this._current = i(0);
                return function(t) { return arc(i(t));    };
            }    
            return pC;
        }
        
        // function to handle legend.
        function legend(lD){
            var leg = {};
                
            // create table for legend.
            var legend = d3.select(id).append("table").attr('class','legend');
            
            // create one row per segment.
            var tr = legend.append("tbody").selectAll("tr").data(lD).enter().append("tr");
                
            // create the first column for each segment.
            tr.append("td").append("svg").attr("width", '16').attr("height", '16').append("rect")
                .attr("width", '16').attr("height", '16')
          .attr("fill",function(d){ return segColor(d.type); });
                
            // create the second column for each segment.
            tr.append("td").text(function(d){ return d.type;});

            // create the third column for each segment.
            tr.append("td").attr("class",'legendFreq')
                .text(function(d){ return d3.format(",")(d.freq);});

            // create the fourth column for each segment.
            tr.append("td").attr("class",'legendPerc')
                .text(function(d){ return getLegend(d,lD);});

            // Utility function to be used to update the legend.
            leg.update = function(nD){
                // update the data attached to the row elements.
                var l = legend.select("tbody").selectAll("tr").data(nD);

                // update the frequencies.
                l.select(".legendFreq").text(function(d){ return d3.format(",")(d.freq);});

                // update the percentage column.
                l.select(".legendPerc").text(function(d){ return getLegend(d,nD);});        
            }
            
            function getLegend(d,aD){ // Utility function to compute percentage.
                return d3.format("%")(d.freq/d3.sum(aD.map(function(v){ return v.freq; })));
            }

            return leg;
        }
        
        // calculate total frequency by segment for all state.
        var tF = ['신용카드', '체크카드','현금','갚을돈'].map(function(d){ 
            return {type:d, freq: d3.sum(fData.map(function(t){ return t.freq[d];}))}; 
        });    
        
        // calculate total frequency by state for all segment.
        var sF = fData.map(function(d){return [d.State,d.total];});

        var hG = histoGram(sF), // create the histogram.
            pC = pieChart(tF), // create the pie-chart.
            leg= legend(tF);  // create the legend.
    }

    var freqData = [];
    
//    $.ajax({
//      
//    })
//    .done(function() {
      freqData=[{State:'식비',freq:{신용카드:4786, 체크카드:200, 현금:1319, 갚을돈:249}}
                ,{State:'교통비',freq:{신용카드:1101, 체크카드:200, 현금:412, 갚을돈:674}}
                ,{State:'생활용품',freq:{신용카드:932, 체크카드:200, 현금:2149, 갚을돈:418}}
                ,{State:'교통/차량',freq:{신용카드:832, 체크카드:200, 현금:1152, 갚을돈:1862}}
                ,{State:'경조사',freq:{신용카드:1101, 체크카드:200, 현금:412, 갚을돈:674}}
                ,{State:'장소대여비',freq:{신용카드:932, 체크카드:200, 현금:2149, 갚을돈:418}}
                ,{State:'미분류',freq:{신용카드:832, 체크카드:200, 현금:1152, 갚을돈:1862}}];
//    });
    

    dashboard('#dashboard',freqData);
  })
  
  
  $(".btnGraph2").on('click', function() {
    var html = "";
    var d = new Date();
    html += "<div class='moneybook-main'>";
    html += "<div class='main-row'>";
    html += "<div>시작일</div>";
    html += "<input type='date' name='sDate' class='sDate'/>";
    html += "</div>";

    html += "<div class='main-row'>";
    html += "<br/>";
    html += "<div>~</div>";
    html += "</div>";
    
    html += "<div class='main-row'>";
    html += "<div>종료일</div>";
    html += "<input type='date' name='eDate' class='eDate'/>";
    html += "</div>";

    html += "<div class='main-row'>";
    html += "<br/>";
    html += "<input type='button' name='search' value='조회' class='search'/>";
    html += "</div>";
    
    html += "<div class='main-row' style='float:right;'>";
    html += "<br/>";
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
    html += "</div>";

    html += "<div class='main-row' style='float:right;'>";
    html += "<br/>";
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
    html += "</div>";

    html += "<div class='main-row' style='float:right;'>";
    html += "<br/>";
    html += "<select class='month' onchange='changeMonth()'>";
    html += "<option>월별</option>";
    for(var i=1; i<=12; i++)
      html+="<option value='"+i+"'>"+i+"월</option>";
    html += "</select>";
    html += "</div>";
    
    html += "<div style='clear:both; height:20px;'></div>";
    html += "<div class='moneybook-list-graph2'>";
    html += "</div>";
    html += "</div>";
    html += "</div>";
    $(".container").html("").append(html);

    // date 클래스에 해당 달의 첫번째 날짜를 기본 값으로 설정
    var strDate = d.getFullYear() + "-" + (d.getMonth()+1) + "-" + "01";
    $(".sDate").val(strDate);

    // date 클래스에 해당 달의 마지막 날짜를 기본 값으로 설정
    var lastDay = new Date(d.getFullYear(), d.getMonth() + 1, 0);
    var lastDayWithSlashes =  lastDay.getFullYear() + '-' + (lastDay.getMonth() + 1) + "-" +(lastDay.getDate());
    $(".eDate").val(lastDayWithSlashes);
    
    
    var salesData=[
      {label:"Basic", color:"#3366CC"},
      {label:"Plus", color:"#DC3912"},
      {label:"Lite", color:"#FF9900"},
      {label:"Elite", color:"#109618"},
      {label:"Delux", color:"#990099"}
    ];

    var svg = d3.select(".moneybook-list-graph2").append("svg").attr("width",900).attr("height",500);

    svg.append("g").attr("id","salesDonut");
    svg.append("g").attr("id","quotesDonut");

    Donut3D.draw("salesDonut", randomData(), 150, 150, 130, 100, 30, 0.4);
    Donut3D.draw("quotesDonut", randomData(), 450, 150, 130, 100, 30, 0);
      
    function changeData(){
      Donut3D.transition("salesDonut", randomData(), 130, 100, 30, 0.4);
      Donut3D.transition("quotesDonut", randomData(), 130, 100, 30, 0);
    }

    function randomData(){
      return salesData.map(function(d){ 
        return {label:d.label, value:1000*Math.random(), color:d.color};});
    }
  });
  
  $(".btnGraph3").on('click', function() {
    var html = "";
    var d = new Date();
    html += "<div class='moneybook-main'>";
    html += "<div class='main-row'>";
    html += "<div>시작일</div>";
    html += "<input type='date' name='sDate' class='sDate'/>";
    html += "</div>";

    html += "<div class='main-row'>";
    html += "<br/>";
    html += "<div>~</div>";
    html += "</div>";
    
    html += "<div class='main-row'>";
    html += "<div>종료일</div>";
    html += "<input type='date' name='eDate' class='eDate'/>";
    html += "</div>";

    html += "<div class='main-row'>";
    html += "<br/>";
    html += "<input type='button' name='search' value='조회' class='search'/>";
    html += "</div>";
    
    html += "<div class='main-row' style='float:right;'>";
    html += "<br/>";
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
    html += "</div>";

    html += "<div class='main-row' style='float:right;'>";
    html += "<br/>";
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
    html += "</div>";

    html += "<div class='main-row' style='float:right;'>";
    html += "<br/>";
    html += "<select class='month' onchange='changeMonth()'>";
    html += "<option>월별</option>";
    for(var i=1; i<=12; i++)
      html+="<option value='"+i+"'>"+i+"월</option>";
    html += "</select>";
    html += "</div>";
    
    html += "<div style='clear:both; height:20px;'></div>";
    html += "<div class='moneybook-list-graph3'>";
    html += "</div>";
    html += "</div>";
    html += "</div>";
    $(".container").html("").append(html);

    // date 클래스에 해당 달의 첫번째 날짜를 기본 값으로 설정
    var strDate = d.getFullYear() + "-" + (d.getMonth()+1) + "-" + "01";
    $(".sDate").val(strDate);

    // date 클래스에 해당 달의 마지막 날짜를 기본 값으로 설정
    var lastDay = new Date(d.getFullYear(), d.getMonth() + 1, 0);
    var lastDayWithSlashes =  lastDay.getFullYear() + '-' + (lastDay.getMonth() + 1) + "-" +(lastDay.getDate());
    $(".eDate").val(lastDayWithSlashes);
    
//    $(".btn").on('click', function() {
//      var sDate = $(".sDate").val();
//      var eDate = $(".eDate").val();
//      selectMainListOption(sDate, eDate);
//    });
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
//    식비 교통비 생활용품
//    교통/차량 경조사
//    장소대여비 미분류
    var color = d3.scale.ordinal()
      .domain(["식비", "교통비", "생활용품", "교통/차량", "경조사", "장소대여비", "미분류"])
      .range(["#98abc5", "#8a89a6", "#7b6888", "#6b486b", "#a05d56", "#d0743c", "#ff8c00"]);
    
    function randomData (){
      var labels = color.domain();
      return labels.map(function(label){
        return { label: label, value: value[cnt++] }
      });
    }
    change(randomData());
    
    d3.select(".search").on("click", function(){
//        value = [];
        var start = $(".sDate").val();
        var end = $(".eDate").val();
        $.ajax({
          url: "/WithProject/moneybook/sortSearchMoneybook.json?start="+start+"&end="+end
        })
        .done(function(response) {  
          $.each(response, function(index, MoneyBookVO) {
            value[index] = response[index].mMoney;
          });
        })
        change(randomData());
      });


    function change(data) {

      cnt = 0;
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
    var dat1 = new Date(arr1[0], arr1[1]);
    var dat2 = new Date(arr2[0], arr2[1]);
    
    for(var i=0; i<=arr2[1]-arr1[1]; i++) {
      if(arr1[1]==12){
        arr1[0] = Number(arr1[0]+1);
        arr1[1] = 01;
      }
    }
    console.log(arr1[0] + "-" + arr1[1]);
  }

  function selectMainListOption(start, end) {
    var total = 0;
    $.ajax({
      url : "/WithProject/moneybook/select_moneybookOption.json?start="+start+"&end="+end
    })
     .done(function(data) {
      var html = "";
      $.each(data, function(index, MoneybookVO) { 
        html += "<div id='moneybook_"+data[index].mNo+"' class='moneybook-item'>";
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
            html += "<button class='btnModify' id='btnModify' onclick='modifyMoneybook("+data[index].mNo+");' style='background:#eee; border: 1px solid #ccc; padding: 5px;  border-radius: 5px;'>";
              html += "<img style=' width: 10px; background: #eee;' alt='' src='/WithProject/images/icon_modify.png'/> 수정";
            html += "</button>";
    
            html += "<button class='btnDelete' id='btnDelete' onclick='deleteMoneybook("+data[index].mNo+");' style='background:#eee; border: 1px solid #ccc; padding: 5px;  border-radius: 5px;'>";
              html += "<img style=' width: 10px; background: #eee;' alt='' src='/WithProject/images/icon_delete.png'/> 삭제";
            html += "</button>";
          html +="</span>";
        html += "</div>";
        
        html += "</div>";
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
      $(this).children().show();
    });
    
    // 마우스 leave시 수정삭제 리모컨 디스플레이 hide
    $(".item-menu").on('mouseleave', function() {
      $(this).children().hide();
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
        html += "<div id='moneybook_"+data[index].mNo+"' class='moneybook-item'>";
        html += "<div class='item-date'><span>"+data[index].mDate+"</span></div>";
        html += "<div class='item_writer'><span>"+data[index].memberNo+"</span></div>";
        html += "<div class='item-memo'><span>"+data[index].mMemo+"</span></div>";
        html += "<div class='item-money'><span>"+data[index].mMoney+"</span></div>";
        html += "<div class='item-spend'><span>"+data[index].mLeft+"</span></div>";
        html += "<div class='item-import'><span>"+data[index].mRight+"</span></div>";
        html += "<div class='item-menu'>";
          html += "<span class='menu-span'>";
            html += "<button class='btnModify' id='btnModify' onclick='modifyMoneybook("+data[index].mNo+");' style='background:#eee; border: 1px solid #ccc; padding: 5px;  border-radius: 5px;'>";
              html += "<img style=' width: 10px; background: #eee;' alt='' src='/WithProject/images/icon_modify.png'/> 수정";
            html += "</button>";
    
            html += "<button class='btnDelete' id='btnDelete' onclick='deleteMoneybook("+data[index].mNo+");' style='background:#eee; border: 1px solid #ccc; padding: 5px;  border-radius: 5px;'>";
              html += "<img style=' width: 10px; background: #eee;' alt='' src='/WithProject/images/icon_delete.png'/> 삭제";
            html += "</button>";
          html +="</span>";
        html += "</div>";
        
        html += "</div>";
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
      html += "<div id='moneybook_"+data.mNo+"' class='moneybook-item'>";
        html += "<div class='item-date'><span>"+data.mDate+"</span></div>";
        html += "<div class='item_writer'><span>"+data.memberNo+"</span></div>";
        html += "<div class='item-memo'><span>"+data.mMemo+"</span></div>";
        html += "<div class='item-money'><span>"+data.mMoney+"</span></div>";
        html += "<div class='item-spend'><span>"+data.mLeft+"</span></div>";
        html += "<div class='item-import'><span>"+data.mRight+"</span></div>";
        html += "<div class='item-menu'>";
        html += "<span class='menu-span'>";
          html += "<button class='btnModify' onclick='modifyMoneybook("+data.mNo+");' id='btnModify' style='background:#eee; border: 1px solid #ccc; padding: 5px;  border-radius: 5px;'>";
            html += "<img style=' width: 10px; background: #eee;' alt='' src='/WithProject/images/icon_modify.png'/> 수정";
          html += "</button>";
  
          html += "<button class='btnDelete' onclick='deleteMoneybook("+data.mNo+");' id='btnDelete' style='background:#eee; border: 1px solid #ccc; padding: 5px;  border-radius: 5px;'>";
            html += "<img style=' width: 10px; background: #eee;' alt='' src='/WithProject/images/icon_delete.png'/> 삭제";
          html += "</button>";
        html +="</span>";
      html += "</div>";
      html += "</div>";
      $(".moneybook-list").prepend(html);
      menuShow();
    })
  }
  
  // 가계부 내역 수정
  function modifyMoneybook(no) {
    
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
  
  