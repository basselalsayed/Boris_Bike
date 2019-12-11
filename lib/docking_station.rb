require_relative "bike"

class DockingStation

  attr_reader :bike

  def release_bike
    raise 'No bikes available' unless @bike
    @bike
  end

  def dock(bike)
    raise "No space" unless @bike.nil?
    @bike = bike
  end

end