require "docking_station"
require 'rspec/expectations'

describe DockingStation do
  # let(:station) {DockingStation.new}

  it { is_expected.to respond_to :release_bike }

  describe '#dock' do
    it { expect(subject.dock(Bike.new())).to be_a(Array) }
  end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
  end

  describe 'unable to release bike when station is empty' do
    it { expect { subject.release_bike }.to raise_error 'No bikes available' }
  end
  
  describe '#dock' do
    it 'attempts to dock when station is full' do
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

  describe '#broken' do
    it 'is able to store a broken bike' do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike) 
      expect(subject.bikes).to include(bike)
    end
  end

  describe '#release_bike' do

    it 'raises an error when no working bikes are available' do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike) 
      expect{subject.release_bike}.to raise_error 'No working bikes available'
    end
  end

end