class DockingStation
  require_relative 'bike'

  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise("No bikes available") if empty?
    pop_bike
  end

  def dock(bike,is_working = true)
    fail "Station is full" if full?
    bike.working = is_working
    @bikes << bike
  end

  private
  def pop_bike
    working_bikes = @bikes.select {|bike| bike.working}
    working_bikes.empty? ? raise("No working bikes available"): working_bikes.pop
  end

   def full?
     @bikes.count == capacity
   end

   def empty?
     @bikes.empty?
   end

end
