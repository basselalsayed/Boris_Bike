require_relative 'bike'
require_relative 'docking_station'

class Van
attr_reader :broken_bikes
  def initialize
    @broken_bikes = []
    # @working_rack = []
  end

  def pick_up_broken(station)
    station.broken_to_load.each { |bike| @broken_bikes << bike }
    @broken_bikes
  end

  def delivers_broken(garage)
    @broken_bikes.each { |bike| garage.bike_deliveries << bike}
    @broken_bikes = []
  end


end
