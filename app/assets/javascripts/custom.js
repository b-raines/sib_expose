function rotate(element, degree) {
	element.css({ WebkitTransform: 'rotate(' + degree + 'deg)' });
	element.css({ '-moz-transform': 'rotate(' + degree + 'deg)' });
}

$(document).ready(function() {
	$(document.body).on('click', '.dropdown', function() {
		event.preventDefault();
		$(this).parent().find('.attendee-list').toggle('fast');
	});
});