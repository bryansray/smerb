$(document).ready(function($){
	$("div.comment_form form").attach(CommentForm);
	$(".comments .actions .delete").attach(RemoveComment, { type: 'DELETE', dataType: 'json' });
});

RemoveComment = $.klass(Remote.Link, {
	initialize: function($super, options) {
		this.comment = this.element.parents(".comment");

		$super(options);
	},
	
	complete: function(response, result) {
	},
	
	success: function(a, b) {
		this.comment.fadeOut('5000');
	}
});

CommentForm = $.klass(Remote.Form, {
	initialize: function($super, options) {	
		this.submit_button = $(".submit_comment", this.element);
		this.submit_text = this.submit_button.val();
		
		this.spinner = $(".small_spinner", this.element);
		this.result_box = $("#comments");
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
		var $comment = $(response);
		this.result_box.prepend($comment);
		$comment.effect('highlight', {}, 6000);
		this.text_area.val('');
	},
	
	error: function() {
		this.result_box.text("There was an error submitting your comment. Please try again.").fadeIn(100);
	},
	
	disable: function() {
		this.submit_button.attr('disabled', 'disabled').val('Sending ...');
	},
	
	enable: function() {
		this.submit_button.removeAttr('disabled').val(this.submit_text);
	}
});