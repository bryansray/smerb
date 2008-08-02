class Comment
  include DataMapper::Resource

  property :id, Serial
  property :post_id, Integer
  property :author, String
  property :email, Text
  property :url, Text
  property :text, Text
  property :ip, String
  property :agent, String
  property :created_at, DateTime
  property :updated_at, DateTime
  
  belongs_to :post
  
  validates_present :author, :email, :text
  
  before :save, :check_valid_comment
  
  def to_html
    red_cloth = RedCloth.new text
    red_cloth.to_html
  end
  
  def check_valid_comment
    m = Mollom.new :public_key => '75595698a9ad3a5790f1dbf11d3b4369', :private_key => '13f70531c3bd4ec030786ebfb95062d6'
    c = m.check_content :post_body => text, :author_name => author, :author_url => url, 
                        :author_mail => email, 
                        :author_ip => ip
    is_spam = c.spam?
  end
end