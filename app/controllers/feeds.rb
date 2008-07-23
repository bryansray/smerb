class Feeds < Application
  provides :xml
  
  def index
    @posts = Post.all :status => :published, :limit => 10, :order => [:published_at.desc]
    render
  end
  
end
