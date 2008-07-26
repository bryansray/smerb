class Posts < Application
  before :login_required, :only => [:new]
    
  def index
    @posts = Post.paginate :page => params[:page], :per_page => 10, :status => :published, :order => [:published_at.desc]
    @comments = Comment.all :post_id => @posts.collect { |p| p.id }, :limit => 10, :order => [:created_at.desc]
    render
  end
  
  def show
    if params[:slug]
      datetime = DateTime.new params[:year].to_i, params[:month].to_i, params[:day].to_i
      @post = Post.first :slug => params[:slug], :published_at.gte => datetime if params[:slug]
    else
      @post = Post.first :slug => params[:id] if params[:id]
    end
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
