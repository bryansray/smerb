class Comments < Application
  provides :js
  before :login_required, :only => [:destroy]

  def index
    render
  end
  
  def create
    comment = Comment.new params[:comment]
    
    raise BadRequest unless comment.save

    send_mail CommentMailer, :notify_on_comment_created, 
      {
        :from => "mailer@bryanray.net",
        :to => "bryan@bryanray.net",
        :subject => "[Comment] New Comment Created" 
      }, 
      { :comment => comment } unless comment.spam?

    render partial('comments/comment', :comment => comment), :layout => false

  end
  
  def destroy
    comment = Comment.get params[:id]
    
    return BadRequest unless comment.destroy
    render "true"
  end
end
