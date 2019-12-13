require "docking_station"
require 'rspec/expectations'

describe DockingStation do
  let(:bike) {double( :broken? => true)}
  let(:bike2) {double(:report_broken => false, :broken? => false)}

  it { is_expected.to respond_to :release_bike }

  describe '#dock' do
    it { expect(subject.dock(Bike.new())).to be_a(Array) }
  end

  describe '#release_bike' do
    it 'releases a bike' do
      subject.dock(bike2)
      expect(subject.release_bike).to eq bike2
    end
  end

  describe 'unable to release bike when station is empty' do
    it { expect { subject.release_bike }.to raise_error 'No bikes available' }
  end
  
  describe '#dock' do
    it 'attempts to dock when station is full' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(bike) }
      expect { subject.dock(bike)}.to raise_error 'No Space'
  end
end

  describe '#initialize' do
    it 'is able to set a variable bike capacity' do
      station = DockingStation.new(50)
      50.times { station.dock(bike)}
      expect {station.dock(bike) }.to raise_error 'No Space'
    end
  end

  describe '#broken' do
    it 'is able to store a broken bike' do
      subject.dock(bike) 
      expect(subject.bikes).to include(bike)
    end
  end

  describe '#release_bike' do
    it 'raises an error when no working bikes are available' do 
      subject.dock(bike)
      expect{subject.release_bike}.to raise_error 'No working bikes available'
    end
  end

  describe '#broken_to_load' do
    it 'delivers broken bikes to a van' do
    subject.dock(bike)
    subject.dock(bike2)
    p subject.bikes
    subject.broken_to_load
    expect(subject.bikes).to eq [bike2]
  end
end
end