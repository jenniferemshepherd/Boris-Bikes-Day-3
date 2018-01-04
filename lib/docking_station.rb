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
    @bikes << bike
  end

end
