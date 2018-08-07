/**
 * @name	jQuery.touchSlider
*/

$(document).ready(function () {
	$(".focus").hover(function(){
		$("#btn-prev,#btn-next").fadeIn()
		},function(){
		$("#btn-prev,#btn-next").fadeOut()
		})
	$dragBln = false;
	$(".focus-item").touchSlider({
		flexible : true,
		speed : 200,
		btn_prev : $("#btn-prev"),
		btn_next : $("#btn-next"),
		paging : $(".flicking-con a"),
		counter : function (e) {
			$(".flicking-con a").removeClass("on").eq(e.current-1).addClass("on");
		}
	});
	$(".focus-item").bind("mousedown", function() {
		$dragBln = false;
	})
	$(".focus-item").bind("dragstart", function() {
		$dragBln = true;
	})
	$(".focus-item a").click(function() {
		if($dragBln) {
			return false;
		}
	})
	timer = setInterval(function() { $("#btn-next").click();}, 5000);
	$(".focus").hover(function() {
		clearInterval(timer);
	}, function() {
		timer = setInterval(function() { $("#btn-next").click();}, 5000);
	})
	$(".focus-item").bind("touchstart", function() {
		clearInterval(timer);
	}).bind("touchend", function() {
		timer = setInterval(function() { $("#btn-next").click();}, 5000);
	})
});