class Posts < Application
  before :login_required, :only => [:new]
    
  def index
    @posts = Post.all :limit => 5
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
  
  def create
    post = Post.new params[:post]
    
    if post.save
      redirect url(:post, post)
    end
  end
  
end
