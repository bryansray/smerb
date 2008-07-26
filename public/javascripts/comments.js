CommentForm = $.klass(Remote.Form, {
	initialize: function($super, options) {
		// The submit button
		console.info("Initializing the comment form ...");
		
		this.submit_button = $(".submit_comment", this.element);
		this.submit_text = this.submit_button.text();
		
		this.spinner = $(".small_spinner", this.element);
		this.result_box = $(".comment_waiting", this.element);
		this.text_area = $("textarea", this.element);
		
		$super();
	},
	
	beforeSend: function() {
		this.spinner.show();
		this.disable();
	},
	
	complete: function() {
		this.spinner.hide();
		this.enable();
	},
	
	success: function() {
		this.result_box.text("Comment created.").fadeIn(100);
		this.text_area.val("");
		$(document).trigger('close.facebox');
	},
	
	error: function() {
		this.result_box.text("There was an error submitting your comment. Please try again.").fadeIn(100);
	},
	
	disable: function() {
		this.submit_button.attr('disabled', 'disabled').val('Sending comment ...');
	},
	
	enable: function() {
		this.submit_button.removeAttr('disabled').val(this.submit_text);
	}
});

$(document).ready(function($){
	console.info("Attaching ...");
	$("div.comment_form form").attach(CommentForm);
});