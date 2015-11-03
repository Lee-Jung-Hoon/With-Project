$(document).ready(function(){
	var top, left, temp, drop, tempIndex, dropIndex;
	isDrop = false;
	$('.img-wrap').draggable( {
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
			if (num == -1) {
				$(this).after(temp);
			} else {
				$(this).before(temp);
			}
			$('#container').pinto();
		}
	});
	$('.img-wrap a').on('click',function(){
		//var st = $('body').scrollTop();
		$(this).parents('.img-wrap').addClass('on');
		$('body').addClass('view');
		//$('.max').addClass('show');
		var scroll = $(window).scrollTop();
		var boxTop = parseInt($('.box').css('top'));
		$('.box').addClass('open', callbackOpen).css('top', 30 + scroll + 'px');
		return false;
	});

	$('.box .btn-close').on('click', function(){
		$('.box').removeClass('open', callbackClose);			
		$('.list-content').removeClass('scroll');
	}); 
	
	
	var slide, slideAction, isOver;

	function callbackOpen() {
		setTimeout(function() {
		$('.list-content').addClass('scroll');
		//isOver = false;
		
		//setTimeout(slideAction,5000);
	  }, 1000 );
	}
	function callbackClose() {
	  setTimeout(function() {
		//$('.max').removeClass('show');
		$('body').removeClass('view');
		$('.img-wrap').removeClass('on');
		//isOver = true;
		
		//clearTimeout(slide);
	  }, 1000 );
	}
	/*
	$('.roll-btn, .img-rolling-s > ul > li > a').on('mouseenter', function(){
		isOver = true;
		
		clearTimeout(slide);
	})
	.on('mouseleave', function(){
		isOver = false;
		
		setTimeout(slideAction,5000);
	});
	
	function slideAction() {
		slide = setTimeout(slideAction, 5000);
		
		if (isOver == false) {
			$('.roll-btn-right').click();
		} 
	}
	*/
	/* 작은 이미지 효과 */
	

	//var rsLen = $('.img-rolling-s > ul > li').length;
	//$('.img-rolling-s > ul').css('width', 200 * rsLen + 'px');
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
	

});