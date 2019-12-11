require "docking_station"
require 'rspec/expectations'

describe DockingStation do
  let(:station) {DockingStation.new}

  it { is_expected.to respond_to :release_bike }

  # it 'releases working bikes' do
  #   bike = subject.release_bike
  #  expect(bike).to be_working
  # end

  describe '.working?' do
    it { expect(Bike.new.working?).to equal(true) }
  end

  describe '.dock' do
    it { expect(station.dock(Bike.new())).to be_a(Bike) }
  end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
  end

  describe 'release bike when bike not docked' do
    it { expect { station.release_bike }.to raise_error 'No bikes available' }
  end
  
end

