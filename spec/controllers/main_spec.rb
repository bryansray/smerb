require File.join(File.dirname(__FILE__), "..", 'spec_helper.rb')

describe Main, "index action" do
  before(:each) do
    @post = mock(:post)
    @posts = [@post]
  end

  def do_get
    dispatch_to(Main, :index) do |controller|
      controller.stub!(:render)
      controller.should_receive(:render)
    end
  end

  it "should find a list of posts" do
    Post.should_receive(:all).and_return(@posts)
    do_get
  end

end