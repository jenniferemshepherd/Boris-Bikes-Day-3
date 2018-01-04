require 'docking_station'

describe DockingStation do
  it {is_expected.to respond_to(:release_bike)}

  describe '#release_bike' do
    it 'releases a bike' do
      station = DockingStation.new
      bike = Bike.new
      station.dock(bike)
      expect(station.release_bike).to eq bike
    end

    it 'releases working bike' do
      station = DockingStation.new
      bike = Bike.new
      station.dock(bike)
      bike = station.release_bike
      expect(bike).to be_working
    end
end

  it {is_expected.to respond_to(:dock).with(1).argument}

  it 'docks bike' do
    station = DockingStation.new
    bike = Bike.new
    station.dock(bike)
    expect(station.bikes).to eq [bike]
  end

  it 'will not release a bike if none available' do
    station = DockingStation.new
    expect {station.release_bike}.to raise_error "No bikes available"
  end

 end
