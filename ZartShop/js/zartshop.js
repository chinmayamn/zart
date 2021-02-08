// JavaScript Document
$(document).ready(function(){
	$(".list").click(function() {
		$("div.pro-new").removeClass("pro-new").addClass("pro-new-list");
	});
	$(".grid").click(function() { 
		$("div.pro-new-list").removeClass("pro-new-list").addClass("pro-new");
	});
	
	
	$('.cats').click(function(){
		$('.show-cat').slideToggle();
	});
	$('.close').click(function(){
		$('.show-cat').slideUp();
	});
	
	$('.categories').hide();
	$('.cats').mouseover(function(){
		$('.categories').slideDown();						  
	});
	$('.all-cat').mouseleave(function(){
		$('.categories').slideUp();						  
	});
	
	
	$('.cat-menus li a').mouseover(function(){
		$(this).parent().children('.sub-catlist').slideDown();
	});

	$('.cat-menus li').mouseleave(function(){
		$(this).children('.sub-catlist').slideUp();
	});
	
	$('.cat-menus li .sub-catlist').mouseover(function(){
		$(this).parent().children('a').addClass('highlight');												   
	});
	$('.cat-menus li .sub-catlist').mouseout(function(){
		$(this).parent().children('a').removeClass('highlight');												   
	});
	
	
});