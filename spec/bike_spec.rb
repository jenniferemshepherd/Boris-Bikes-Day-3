require 'bike'

describe Bike do
  it 'responds to working?' do
    bike = Bike.new
    expect(bike).to respond_to :working?
  end

  it 'works' do
    #expect(subject.working?).to eq true
    expect(subject).to be_working
  end

  it 'is broken' do
    subject.working = false
    expect(subject).not_to be_working
  end

  it 'can be set to working' do
    subject.working = true
    expect(subject).to be_working
  end

end
