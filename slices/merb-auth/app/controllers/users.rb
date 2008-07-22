class MerbAuth::Users < MerbAuth::Application 
  # Your stuff in here   
  before :login_required
end