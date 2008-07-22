class Feeds < Application
  provides :xml
  
  def index
    @posts = Post.all :limit => 10
    render
  end
  
end
