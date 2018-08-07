/**
 * @name	jQuery.nav.cursor
*/

$(function() {
	var $t, leftX, newWidth;

	$('.nav_cursor ul').append('<div class="block"></div>');
	var $block = $('.block');

	$block.width($(".current").width()).css('left', $('.current a').position().left).data('rightLeft', $block.position().left).data('rightWidth', $block.width());

	$('.nav_cursor ul li').find('a').hover(function() {
		$t = $(this);
		leftX = $t.position().left;
		newWidth = $t.parent().width();

		$block.stop().animate({
			left: leftX,
			width: newWidth
		},300);
	}, function() {
		$block.stop().animate({
			left: $block.data('rightLeft'),
			width: $block.data('rightWidth')
		},300)
	})
	// $($('.nav_cursor ul li.current'))[0].setAttribute('id','firstLi');
	// var getClass = $($('.nav_cursor ul li.current'))[0].getAttribute('class','current');
	// console.log(getClass)
})