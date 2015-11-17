$(document).ready(function(){
  
  $('.toggle').on('click', function(){
    $(this).parents('.login-sort').toggleClass('on').siblings().removeClass('on');
    $('.login-sort').removeClass('z-index');
    if ($(this).parents('.login').hasClass('on')) {
      $(this).parents('.login').removeClass('z-index');
    } else {
      $(this).parents('.login').addClass('z-index');
    }
  });
  
  $('.btn-search').on('click', function() {
    if ($('.ico-search').hasClass('active')) {
        return false;
    
    } else if ($('.ico-search').hasClass('close')) {
        $('.ico-search').addClass('active');
        $('.element-one').velocity({
            duration: 250,
            easing: 'easeOutSine',
            top: 0,
            width: '50px',
            left: '12px',
            borderWidth:'4px',
            borderRadius: '50%'
        });
        $('.element-two').velocity({
            rotateZ: '-45deg',
            left:'66px',
            top:'-20px',
            height:'40px',
            borderWidth:'2px'
        }, {
            duration: 500,
            easing: 'easeOutSine',
            complete: function() {
                $('.ico-search').removeClass('active');
            }
        });
        $('.ico-search').addClass('ico-function').removeClass('close');
        $('.search').animate({'height':0}, 400, function(){
          $(this).css('display','block');
        });
    }
    else if ($('.ico-search').hasClass('ico-function')) {
        $('.ico-search').addClass('active');
        $('.element-one').velocity({
            width: '0',
            borderRadius: '0',
            rotateZ: '-45deg',
            left: '47px',
            borderWidth: '3px',
            top: '10px'
        }, {
            duration: 250,
            easing: 'easeOutSine'
        });
        $('.element-two').velocity({
            rotateZ: '225deg',
            left: '47px',
            borderWidth: '3px',
            height: '50px',
            top: '-45px'
        }, {
            duration: 500,
            easing: 'easeOutSine',
            complete: function() {
              $('.ico-search').removeClass('active');
            }
        });
        $('.ico-search').addClass('close').removeClass('ico-function');
        $('.search').css('display','table').animate({'height':'700px'}, 400);
    } 
  });
  $('.pin-btn').on('click', function(){
    $(this).next().toggle();
  });
  $('.pin-list button').on('click', function(){
    $(this).addClass('current').parent().siblings().find('button').removeClass('current');
  });
  $('.container').addClass('effect')
});