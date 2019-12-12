require "docking_station"
require 'rspec/expectations'

describe DockingStation do
  # let(:station) {DockingStation.new}

  it { is_expected.to respond_to :release_bike }

  # it 'releases working bikes' do
  #   bike = subject.release_bike
  #  expect(bike).to be_working
  # end

  describe '#working?' do
    it { expect(Bike.new.working?).to equal(true) }
  end

  describe '#dock' do
    it { expect(subject.dock(Bike.new())).to be_a(Array) }
  end

  # describe "#dock" do
  #   it "raises error when no space" do
  #     bike = Bike.new
  #     subject.dock(bike)
  #     expect{subject.dock(Bike.new)}.to raise_error "No space" 
  #   end
  # end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
  end

  describe 'release bike when station is empty' do
    it { expect { subject.release_bike }.to raise_error 'No bikes available' }
  end
  
  describe '#dock' do
    it 'attempts to dock 21st bike' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new)}.to raise_error 'No Space'
  end
end

describe '#initialize' do
  it 'is able to set a variable bike capacity' do
    station = DockingStation.new(50)
    50.times { station.dock(Bike.new)}
    expect {station.dock(Bike.new) }.to raise_error 'No Space'
  end
end


end