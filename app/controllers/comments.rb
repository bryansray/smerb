class Comments < Application
  provides :js

  # ...and remember, everything returned from an action
  # goes to the client...
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
      { :comment => comment }

    render partial('comments/comment', :comment => comment), :layout => false

  end
  
end
