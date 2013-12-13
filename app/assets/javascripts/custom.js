function rotate(element, degree) {
    element.animate({
                '-webkit-transform': 'rotate(' + degree + 'deg)',
                '-moz-transform': 'rotate(' + degree + 'deg)',
                '-ms-transform': 'rotate(' + degree + 'deg)',
                '-o-transform': 'rotate(' + degree + 'deg)',
                'transform': 'rotate(' + degree + 'deg)',
                'zoom': 1
    }, 5000);
}

$(document).ready(function() {
	$(document.body).on('click', '.dropdown', function() {
		event.preventDefault();
		$(this).parent().find('.attendee-list').toggle('fast');
		console.log($(this).find('span').html());
		$(this).find('.caret').toggleClass('upside-down');
	});
});