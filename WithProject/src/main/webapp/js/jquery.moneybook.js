/**
 * 가계부 관련 jQuery
 */

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

  $(".btnHistory").on('click', function() {
    var html = "";
    html += "<div class='moneybook-main'>";
    html += "<div class='main-row'>";
    html += "<div>시작일</div>";
    html += "<input type='date' name='mDate' class='date'/>";
    html += "</div>";
    
    html += "<div class='main-row'>";
    html += "<div>종료일</div>";
    html += "<input type='date' name='mDate' class='date'/>";
    html += "</div>";
    
    html += "</div>";
    html += "</div>"
    $(".container").html("").append(html);
  });
  
  $(".btnUp").on('click', function() {
  });
  
  $(".btnDown").on('click', function() {
  });
  
  $(".btnMoney").on('click', function() {
  });  

  $(".btnCard").on('click', function() {
  });  
  
});



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
  
  