class Application < Merb::Controller
end

class DateTime
  def display_date
    self.strftime "%B %d, %Y"
  end
  
  def display_time
    self.strftime "%I:%M %p"
  end
end