class Posts < Application
  before :login_required, :only => [:new]
    
  def index
    @posts = Post.all :status => :published, :limit => 5, :order => [:published_at.desc]
    render
  end
  
  def show
    @post = Post.first :slug => params[:slug]
    @comments = @post.comments :order => [:created_at.desc]
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
  
  def edit
    @post = Post.get params[:id]
    render
  end
  
  def update
    @post = Post.get params[:id]

    if @post.update_attributes params[:post]
      redirect url(:slug, :year => @post.published_at.year, :month => @post.published_at.month, :day => @post.published_at.day, :slug => @post)
    else
      render :action => :edit
    end
  end
  
end
