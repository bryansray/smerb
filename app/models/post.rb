class Post
  include DataMapper::Resource

  # Properties
  property :id, Serial
  property :title, Text
  property :text, Text
  property :format, String, :default => "Textile"
  property :user_id, Integer
  property :published_at, DateTime
  property :created_at, DateTime
  property :updated_at, DateTime
  
  # Associations
  belongs_to :user
  
  # Validations
  validates_present :title, :text
  
  # # State
  # is :state_machine, :initial => :new, :column => :status do
  #   state :new
  #   state :published
  #   state :unpublished
  #   
  #   event :publish do
  #     transitions :from => :new, :to => :published
  #     transitions :from => :unpublished, :to => :published
  #   end
  #   
  #   event :unpublish do
  #     transitions :from => :published, :to => :unpublished
  #   end
  # end
  
  def to_html
    red_cloth = RedCloth.new text
    red_cloth.to_html
  end
end

Post.auto_migrate!