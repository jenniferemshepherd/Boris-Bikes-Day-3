require 'docking_station'

describe DockingStation do

  # it {is_expected.to respond_to(:new).with(1).argument}

  it {expect(DockingStation).to respond_to(:new).with(1).argument}
  it 'sets default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end
  it 'has a capacity of 25' do
    station = DockingStation.new(25)
    expect(station.capacity).to eq 25
  end

  it {is_expected.to respond_to(:release_bike)}
  describe '#release_bike' do
    it 'releases a bike' do
      station = DockingStation.new
      bike = double(:bike)
      station.dock(bike)
      expect(station.release_bike).to eq bike
    end
    it 'releases working bike' do
      station = DockingStation.new
      bike = double(:bike)
      station.dock(bike)
      bike = station.release_bike
      expect(bike).to be_working
    end
    it 'doesnt release broken bike' do
      station = DockingStation.new
      bike = double(:bike)
      station.dock(bike,false)
      expect {station.release_bike}.to raise_error "No working bikes available"
    end
    it 'release a bike if one is available even if bikes[0] is broken' do
      station = DockingStation.new
      bike = double(:bike)
      station.dock(bike,false)
      bike2 = double(:bike)
      station.dock(bike2)
      expect(station.release_bike).to eq bike2
    end
    it 'will not release a bike if none available' do
      station = DockingStation.new
      expect {station.release_bike}.to raise_error "No bikes available"
    end
  end

  it {is_expected.to respond_to(:dock).with(1).argument}
  describe '#dock'do
    it 'docks bike' do
      station = DockingStation.new
      bike = double(:bike)
      station.dock(bike)
      expect(station.bikes).to eq [bike]
    end

    it 'docks broken bike' do
      station = DockingStation.new
      bike = double(:bike)
#      bike.working = false
      station.dock(bike,false)
      expect(station.bikes[station.bikes.length-1]).not_to be_working
    end

    it 'will not dock a bike if station is full' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock double(:bike) }
      expect {subject.dock(double(:bike))}.to raise_error "Station is full"
    end

    it 'will not dock a bike if station is full' do
      station = DockingStation.new(25)
      station.capacity.times { station.dock double(:bike) }
      expect {station.dock(double(:bike))}.to raise_error "Station is full"
    end
  end
 end
