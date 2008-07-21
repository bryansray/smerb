class Posts < Application
  
  def index
    @posts = Post.all
    render
  end
  
  def show
    @post = Post.first :slug => params[:slug]
    render
  end
  
  def new
    @post = Post.new
    render
  end
  
end
