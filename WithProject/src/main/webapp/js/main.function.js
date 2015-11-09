$(document).ready(function(){
  var startPage = 1;
  var endPage = 20;
  MainList(startPage, endPage);
  
  $(document).scroll(function () {
     var documentHeight = $(document).height();
     var scrollBottom = $(window).scrollTop() + $(window).height();
     console.log(documentHeight);
     console.log(scrollBottom);
     if(documentHeight<scrollBottom+100) {
       startPage = startPage +20;
       endPage = endPage +20;
       MainList(startPage, endPage);
     }
  });

  $('.show-login').on('click', function(){
    $(this).next().fadeIn('fast');
  });

  $('.close-login').on('click', function(){
    $(this).parent().fadeOut('fast');
  });
  
});

function MainList(startPage, endPage) {
  // ajax 리스트 호출
  $.ajax({
    url : "/WithProject/studygroup/groupList.json?startPage="+startPage+"&endPage="+endPage,
    dataType : "json"      
  })
  .done(function(response){
    ListCallback(response, startPage);
  });
}
  function ListCallback (response, startPage){
    var data = JSON.stringify(response);
    $.each(response, function(index ,value) {
      var divHTML = "";
        divHTML = '<div class="img-wrap">'
        +' <div class="img-content">'
        +'<div class="img-inner">'
        +'<span class="img"><img src="/WithProject/images/'+response[index].groupRepImagePath+'" alt="" /></span>'
        +'<span class="txt">'+response[index].groupName+'<br /></span>'
        +'</div>'
        +'<div class="spine spine-left"><a href="#">왼쪽</a></div>'
        +'<div class="spine spine-right"><a href="#">오른쪽</a></div>'
        +'</div></div>';
      $("#container").append(divHTML);
    });
    if(startPage==1)
    showLetter();
    setTimeout(function(){
      $('#container').pinto({
          itemWidth:180,
          gapX:10,
          gapY:10,
          onItemLayout: function($item, column, position) {
        }
      });
    },500);
    ready();
  }; 

function generateRandom() {
    var num = Math.floor(Math.random() * 1000);
    return num;
    
  }
  function showLetter() {
    $(".img-wrap").first().siblings().each(function(){
      var left = generateRandom();
      var top = generateRandom();
      $(this).css({"top": top + "px", "left": left + "px"});
    });
  }

  function ready() {
    
    var top, left, temp, drop, tempIndex, dropIndex;
    isDrop = false;
    $('.img-wrap:not(:eq(0))').draggable( {
      'start' : function(event, ui) {
        top = ui.position.top;
        left = ui.position.left;
        temp = $(this);
        tempIndex = temp.index();
      },
      'drag' : function(event, ui) {
        $(this).addClass('z-index');
      },
      'stop' : function(event, ui) {
        if (isDrop == false) {
          $(this).animate({
              'top':top, 
              'left':left             
          },'slow',
            function(){
              $(this).removeClass('z-index');
            }
          );
        } else {
          $(this).removeClass('z-index');
        }
      }
    }).droppable({
      'drag' : function (event, ui) {
        
      },
      'drop': function(event, ui ) {
        isDrop = true;
        dropIndex = $(this).index();
        num = tempIndex - dropIndex;
        if (dropIndex == 0) {
          isDrop = false;
        } else if (num == -1) {
          $(this).after(temp);
        } else {
          $(this).before(temp);
        }
        $('#container').pinto();
      }
    });
    var isClick = false;
    $('.img-wrap').on('mousemove', function(event){
      
      var position = $(this).offset();
      var spot = event.pageX - position.left;
    
      var standard = 91;
      var rest = 10;
      if (spot < standard - rest) {
        $(this).removeClass('position-right').addClass('position-left');
      } else if (spot > standard + rest ) {
        $(this).removeClass('position-left').addClass('position-right');
      } else {
        $(this).removeClass('position-right').removeClass('position-left');
      }
    }).on('mouseleave', function(){
      if (isClick == false) {
        $(this).removeClass('position-right').removeClass('position-left');
      }
    });

    $('.img-wrap a').on('click',function(){
      isClick = true;
      $(this).parents('.img-wrap').addClass('on');
      $('body').addClass('view');
      var scroll = $(window).scrollTop();
      var boxTop = parseInt($('.box').css('top'));
      $('.box').addClass('open', callbackOpen).css('top', 30 + scroll + 'px');
      return false;
    });

    $('.box .btn-close').on('click', function(){
      $('.box').removeClass('open', callbackClose);     
      $('.list-content').removeClass('scroll');
      isClick = false;
    }); 
    
    
    var slide, slideAction, isOver;

    function callbackOpen() {
      setTimeout(function() {
        $('.list-content').addClass('scroll');
      }, 1000 );
    }
    function callbackClose() {
      setTimeout(function() {
        $('body').removeClass('view');
        $('.img-wrap').removeClass('on');
      }, 1000 );
    }
    
    /* 작은 이미지 효과 */
    
    
    var rollBtnS = $('.img-rolling-s > ul > li > a').on('click', function(){
      index = $(this).parent().index();
      cnt = index-1;
      $('.roll-btn-right').click();
      imageS(current, size, index);
      return false;
    });
    function imageS(current, size, index) {
      current.stop().css('z-index',999).animate({'top':size*index+'px'},300,function(){
        $(this).css('z-index',0);
      });
      $('.img-rolling-s').stop().animate({
        scrollTop : index * size
      },500);
    }
    
    /* 롤링 */
    
    /* 큰 이미지 선언 */ 
    var rLen = $('.img-rolling > ul > li').length;
    var W = parseInt($('.img-rolling > ul > li').css('width'));
    var rollBtn = $('.roll-btn');
    var cnt = 0;
    
    /* 작은 이미지 선언 */
    var current = $('.current');
    var size = 116;
    
    /* 큰 이미지 효과 */
    $('.img-rolling > ul').css('width', W*rLen + 'px');
    rollBtn.on('click', function(){     
      if ($(this).hasClass('roll-btn-right')) {
        if (cnt == rLen-1) {
          cnt = 0;
        } else {
          cnt++;
        }     
      } else {
        if (cnt == 0) {
          cnt = rLen-1;
        } else {
          cnt--;
        }     
      }
      $('.img-rolling > ul').css('transform','translateX(-' + W * cnt + 'px)');
      imageS(current, size, cnt);
    });
}