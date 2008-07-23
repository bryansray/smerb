class Posts < Application
  before :login_required, :only => [:new]
    
  def index
    @posts = Post.all :status => :published, :limit => 5, :order => [:published_at.desc]
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
