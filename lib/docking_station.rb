class DockingStation
  require_relative 'bike'

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise("No bikes available") if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    fail "Station is full" unless @bikes.count < 20
    @bikes << bike
  end

end
