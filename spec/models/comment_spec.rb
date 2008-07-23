require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Comment do
  
  before(:each) do
    @post = Post.new :title => "Title", :text => "Text", :published_at => DateTime.now
    valid_attributes = {
      :author => "Bryan Ray",
      :email => "bryan@bryanray.net",
      :text => "This is the content for the comment.",
      :post => @post
    }
    @comment = Comment.new valid_attributes
  end

  it "should be valid" do
    @comment.should be_valid
  end
  
  it "should require an author name" do
    @comment.author = nil
    @comment.should_not be_valid
  end
  
  it "should require an email address" do
    @comment.email = nil
    @comment.should_not be_valid
  end
  
  it "should require text to be entered" do
    @comment.text = nil
    @comment.should_not be_valid
  end
  
  it "should be associated with a specific post" do
    @comment.post.should == @post
  end

end