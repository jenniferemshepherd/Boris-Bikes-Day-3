require 'docking_station'

describe DockingStation do
  it {is_expected.to respond_to(:release_bike)}

  it 'releases a bike' do
    station = DockingStation.new
    expect(station.release_bike).to be_a Bike
  end

  it 'releases working bike' do
    station = DockingStation.new
    bike = station.release_bike
    expect(bike).to be_working
  end

  it {is_expected.to respond_to(:dock).with(1).argument}

  it 'docks bike' do
    station = DockingStation.new
    bike = station.release_bike
    station.dock(bike)
    expect(station.bikes).to eq [bike]
  end

 end
