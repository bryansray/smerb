require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Post do
  before(:each) do
    valid_attributes = {
      :title => "This is a title", 
      :text => "This is the text for the post"
    }
    @post = Post.new valid_attributes
  end

  it "should be valid" do
    @post.should be_valid
  end
  
  it "should require a title" do
    @post.title = nil
    @post.should_not be_valid
  end
  
  it "should require text" do
    @post.text = nil
    @post.should_not be_valid
  end
end