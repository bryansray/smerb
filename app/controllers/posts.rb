class Posts < Application
  
  def index
    @posts = Post.all
    render
  end
  
  def show
    @post = Post.get params[:id]
    render
  end
  
end
