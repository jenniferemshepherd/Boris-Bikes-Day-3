# require './lib/docking_station'
#
# def empty_station
#   DockingStation.new
# end
#
# def station_with_one_docked_bike
#     station = DockingStation.new
#     station.dock(Bike.new)
#     return station
# end
#
# def release_bike_from_empty_station
#   station = empty_station
#   station.release_bike
# end
#
# def release_bike_station_with_available
#   station = station_with_one_docked_bike
#   station.release_bike
# end
#
# def station_at_full_capacity
#   station = DockingStation.new
#   DockingStation::DEFAULT_CAPACITY.times {station.dock(Bike.new)}
#   return station
# end
