require "docking_station"

describe DockingStation do
  let(:station) {DockingStation.new}

  it { is_expected.to respond_to :release_bike }

  # it 'releases working bikes' do
  #   bike = subject.release_bike
  #  expect(bike).to be_working
  # end

  describe '.working?' do
    it { expect(station.release_bike.working?).to equal(true) }
  end

  describe '.dock' do
    it { expect(station.dock(Bike.new())).to be_a(Bike) }
  end
end

