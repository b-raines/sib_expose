$(document).ready(function() {
	$(document.body).on('click', '.dropdown', function() {
		event.preventDefault();
		$(this).parent().find('.attendee-list').toggle('fast');
	});
});