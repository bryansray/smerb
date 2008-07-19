class Main < Application
  
  def index
    @posts = Post.all :limit => 5
    render
  end
  
end
