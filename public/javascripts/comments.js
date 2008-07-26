$(document).ready(function($){
	$("#facebox div.comment_form form").attach(CommentForm);
});

CommentForm = $.klass(Remote.Form, {
	initialize: function($super, options) {	
		console.info("Attaching ...");
		this.submit_button = $(".submit_comment", this.element);
		this.submit_text = this.submit_button.text();
		
		this.spinner = $(".small_spinner", this.element);
		this.result_box = $("#comment_box");
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
	
	success: function(response, status) {
		this.result_box.prepend(response);
		var $comment = $("#comment_box :first").hide();
		
		$comment.effect('highlight', {}, 6000);
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