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
    render partial('comments/comment', :comment => comment), :layout => false
  end
  
end
