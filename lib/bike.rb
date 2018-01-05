class Bike
  attr_accessor :working

  def initialize
    @working = true
  end

  def working?
    return @working
  end
end
