class Post
  include DataMapper::Resource

  # Properties
  property :id, Serial
  property :title, Text
  property :text, Text
  property :slug, Text
  property :format, String, :default => "Textile"
  # property :status, String, :default => 'new'
  property :user_id, Integer
  property :published_at, DateTime
  property :created_at, DateTime
  property :updated_at, DateTime
  
  # Associations
  belongs_to :user
  has n, :comments
  
  # Validations
  validates_present :title, :text
  
  before :save, :set_slug
  
  # State
  is :state_machine, :initial => :new, :column => :status do
    state :new
    state :published
    state :unpublished
    
    event :publish do
      transitions :from => :new, :to => :published
      transitions :from => :unpublished, :to => :published
    end
    
    event :unpublish do
      transitions :from => :published, :to => :unpublished
    end
  end
  
  def text
    attribute_get(:text).gsub("\n", "")
  end
  
  def to_html
    red_cloth = RedCloth.new text
    red_cloth.to_html
  end
  
  def to_param
    slug
  end
  
  private
  def set_slug
    self.slug = self.title.gsub(/[^a-zA-Z0-9 ]/, "").gsub(/[ ]+/, " ").gsub(/ /, "-").downcase
  end
end