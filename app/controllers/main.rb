class Main < Application
  
  def index
    @posts = Post.all :status => :published, :limit => 5, :order => [:published_at.desc]
    render
  end
  
end
