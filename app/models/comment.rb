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
  property :is_spam, Boolean, :default => true
  property :created_at, DateTime
  property :updated_at, DateTime
  
  belongs_to :post
  
  validates_present :author, :email, :text
  
  def to_html
    red_cloth = RedCloth.new text
    red_cloth.to_html
  end
  
  def is_spam=(value)
    attribute_set(:is_spam, false) unless value == 4
  end
end