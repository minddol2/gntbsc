/*
�쒖옉 : http://designblack.com
�좎쭨 : 2016-09-08
*/

$(document).ready(function(){
	(function(){
			var $window=$(window);
			var $body=$('body');			
			var $lnb=$('#d_lnb');
			var $gnb=$('#d_gnb');
			var $bg=$('#d_lnb_bg');
			var $li=$lnb.find('li');
			var $dd=$lnb.find('dd');
			var $sub=$lnb.find('.sub');
			var $lnb_btn=$('#d_lnb_btn , #d_gnb .close, #d_lnb_mask');
			var winWidth=$window.width();
			var current=0;
			var speed=300;
			var subHeight=$sub.find('dl').height();
			var inflection=1200;           //�댁긽�꾨�怨≪젏
			var scrollTop=0;

			
	/*200818*/
	var href_list = [];
	var $li2 = $lnb.find('li');

	$li2.children('a.flip').each(function(i){
		href_list[i] = $(this).attr('href');
	});

	if($(window).width()<inflection){
		$li2.children('a.flip').attr('href','javascript:;');
	}else{
		$li2.children('a.flip').each(function(i){
			$(this).attr('href',href_list[i]);
		});
	}

	$(window).resize(function(){
		if($(window).width()<inflection){
			$li2.children('a.flip').attr('href','javascript:;');
		}else{
			$li2.children('a.flip').each(function(i){
				$(this).attr('href',href_list[i]);
			});
		}
	});
	/*end 200818*/

			
			//scrollTop
			$(document).scroll(function(){
				
				scrollTop=$window.scrollTop();
				if(scrollTop>1){
					$body.addClass('scroll');
				}else{
					$body.removeClass('scroll');
				}
			})  

			//event
			$li.bind({
				//pc �ㅻ쾭,�꾩썐
				mouseenter:function(){
					if(winWidth>=inflection){
						$body.addClass('lnb_over');
						$(this).addClass('on');
                        subHeight=$sub.find('dl').height()+120;
						$sub.stop().animate({'height':subHeight},speed);
						$bg.stop().animate({'height':subHeight},speed);
					}

				},
				mouseleave:function(){
					if(winWidth>=inflection){
						$body.removeClass('lnb_over');
						$(this).removeClass('on');
						$sub.stop().animate({'height':0},speed);
						$bg.stop().animate({'height':0},speed);
					}
				},
				//紐⑤컮�쇳겢由�
				click:function(){			
					if(winWidth<inflection){
						if(current!=$li.index($(this))){
							$li.removeClass('on');
						}
						current=$li.index($(this));				
						$(this).toggleClass('on');
					
					}
				}
			});
			$sub.bind('click',function(e){
				//e.stopPropagation();
			});

			$lnb_btn.bind('click',function(){
				$body.toggleClass('lnb_on');
				if($body.hasClass('lnb_on')){
					$lnb.css({'right':'-100%'}).stop().animate({'right':0},speed);
					$gnb.css({'right':'-100%'}).stop().animate({'right':0},speed);
				}else{
					$lnb.css({'right':'0'}).stop().animate({'right':'-100%'},speed);
					$gnb.css({'right':'0'}).stop().animate({'right':'-100%'},speed);
					$li.removeClass('on');

				}
			});
		 
			
			//body class 遺꾧린
			function setBodyClass(_b){
				//jquery scroll�ъ씠利덈� 諛섏쁺紐삵븿
				
				winWidth=window.innerWidth;
				if(winWidth==null){
					winWidth=$window.innerWidth();
				}

					
				if(winWidth>=inflection){
					$body.addClass('pc');
					$body.removeClass('mo');
					//$lnb.height('auto');

				}else{
					$body.addClass('mo');
					$body.removeClass('pc');
				//	$lnb.height($window.outerHeight()-$lnb.position().top+scrollTop);
				}
				$li.removeClass('on')
				
				
			};
			setBodyClass();

			$window.resize(function(){
				setBodyClass();		
			});

			//濡쒕뵫�쒕젅�대줈 �믪씠媛� 諛섏쁺�� �덈릺�뷀쁽�� �쒓굅
			setTimeout(setBodyClass,1000);
	})();

});