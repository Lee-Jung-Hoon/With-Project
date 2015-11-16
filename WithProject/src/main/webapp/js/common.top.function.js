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
    } else if ($('.ico-search').hasClass('ico-function')) {
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
            easing: 'easeOutSine',
            complete: function() {
        
            }
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
    } else if ($('.ico-search').hasClass('close')) {
        $('.ico-search').addClass('active');
        $('.element-one').velocity('reverse', {
            duration: 250,
            easing: 'easeOutSine',
            complete: function() {
                $('.element-one').velocity({
                    width: '50px',
                    borderRadius: '50%'
                }, {
                    duration: 250,
                    easing: 'easeOutSine'
                });
            }
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
    }
  });
});