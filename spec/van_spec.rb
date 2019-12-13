# require 'docking_station'
# require 'bike'
require 'rspec/expectations'
require 'van'


describe Van do
  describe '#initialization' do
    it {expect(subject).to be_an_instance_of Van }
  end

  describe '#pick_up_broken' do

    it 'picks up broken bikes from a docking station' do
      station = DockingStation.new
      bike = Bike.new
      bike.report_broken
      station.dock(bike)
      expect(subject.pick_up_broken(station)).to eq ([bike])
    end
  
    it 'delivers broken bikes to a given garage' do
      garage = []
      expect(subject.delivers_broken(garage)).to eq []
    end

  end

  




end







