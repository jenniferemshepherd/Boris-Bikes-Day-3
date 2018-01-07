require 'docking_station'

describe DockingStation do
  let(:bike) { double :bike }

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
      bike = Bike.new
      allow(bike).to receive(:working?).and_return(true)
      allow(bike).to receive("working=").and_return(true)
      allow(bike).to receive("working").and_return(true)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'releases working bike' do
      bike = Bike.new
      allow(bike).to receive(:working?).and_return(true)
      allow(bike).to receive("working=").and_return(true)
      allow(bike).to receive("working").and_return(true)
      subject.dock(bike)
      bike = subject.release_bike
      expect(bike).to be_working
    end

    it 'doesnt release broken bike' do
      station = DockingStation.new
      bike = Bike.new
      allow(bike).to receive(:working?).and_return(false)
      allow(bike).to receive("working=").and_return(false)
      allow(bike).to receive("working").and_return(false)
      station.dock(bike,false)
      expect {station.release_bike}.to raise_error "No working bikes available"
    end

    it 'release a bike if one is available even if bikes[0] is broken' do
      bike = Bike.new
      subject.dock(bike)
      allow(bike).to receive(:working?).and_return(false)
      allow(bike).to receive("working=").and_return(false)
      allow(bike).to receive("working").and_return(false)
      subject.dock(bike,false)
      bike2 = Bike.new
      allow(bike2).to receive(:working?).and_return(true)
      allow(bike2).to receive("working=").and_return(true)
      allow(bike2).to receive("working").and_return(true)
      subject.dock(bike2)
      expect(subject.release_bike).to eq bike2
    end

    it 'will not release a bike if none available' do
      expect {subject.release_bike}.to raise_error "No bikes available"
    end

  end

  it {is_expected.to respond_to(:dock).with(1).argument}
  describe '#dock'do
    it 'docks bike' do
      bike = Bike.new
      allow(bike).to receive(:working?).and_return(true)
      allow(bike).to receive("working=").and_return(true)
      allow(bike).to receive("working").and_return(true)
      subject.dock(bike)
      expect(subject.bikes).to eq [bike]
    end

    it 'docks broken bike' do
      bike = Bike.new
      allow(bike).to receive(:working?).and_return(false)
      allow(bike).to receive("working=").and_return(false)
      allow(bike).to receive("working").and_return(false)
      subject.dock(bike,false)
      expect(subject.bikes[subject.bikes.length-1]).not_to be_working
    end

    it 'will not dock a bike if station is full' do
      bike = Bike.new
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(bike) }
      allow(bike).to receive(:working?).and_return(true)
      allow(bike).to receive("working=").and_return(true)
      allow(bike).to receive("working").and_return(true)
      expect {subject.dock(bike)}.to raise_error "Station is full"
    end

    it 'will not dock a bike if station is full' do
      bike = Bike.new
      station = DockingStation.new(25)
      station.capacity.times { station.dock(bike) }
      allow(bike).to receive(:working?).and_return(true)
      allow(bike).to receive("working=").and_return(true)
      allow(bike).to receive("working").and_return(true)
      expect {station.dock(bike)}.to raise_error "Station is full"
    end

  end

 end
