class User
  include DataMapper::Resource
  include MerbAuth::Adapter::DataMapper
  # include MerbAuth::Adapter::DefaultModelSetup
  
  attr_accessor :password, :password_confirmation

  # Properties
  property :id,                         Integer,  :serial   => true
  property :login,                      String,   :nullable => false, :length => 3..40, :unique => true
  property :email,                      String,   :nullable => false, :unique => true
  property :first_name,                 String
  property :last_name,                  String
  property :created_at,                 DateTime
  property :updated_at,                 DateTime
  property :activated_at,               DateTime
  property :activation_code,            String
  property :crypted_password,           String
  property :salt,                       String
  property :remember_token_expires_at,  DateTime
  property :remember_token,             String
  property :password_reset_key,         String, :writer => :protected
  
  property :admin, Boolean, :default => false

  # Validations
  validates_is_unique :password_reset_key, :if => Proc.new{|m| !m.password_reset_key.nil?}
  validates_present        :password, :if => proc{|m| m.password_required?}
  validates_is_confirmed   :password, :if => proc{|m| m.password_required?}
  
  # Associations
  has n, :posts

  before :valid? do
    set_login
  end

  before :save,   :encrypt_password
  before :create, :make_activation_code
  after  :create, :send_signup_notification
  
  def full_name
    "#{first_name} #{last_name}"
  end

end
