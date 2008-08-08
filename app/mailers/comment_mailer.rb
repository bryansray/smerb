class CommentMailer < Merb::MailController

  def notify_on_comment_created
    @comment = params[:comment]
    render_mail
  end
  
end
