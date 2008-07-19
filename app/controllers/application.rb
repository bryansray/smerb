class Application < Merb::Controller
end

class DateTime
  def display
    self.strftime "%B %d, %Y"
  end
end