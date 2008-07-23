class Comment
  include DataMapper::Resource
  
  property :post_id, Serial
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
end