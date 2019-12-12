require_relative "bike"

class DockingStation
  
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
  @capacity = capacity
  @bikes = []
  # @bike = bike
  end

  attr_reader :bikes,


  def release_bike
    raise 'No bikes available' if @bikes if empty?
    @bikes.pop
  end

  def dock(bike)
    raise "No space" if @bikes if full?
    @bikes << bike
  end

  private 

  def full?
    @bikes.length >= 20 
  end

  def empty?
    @bikes.empty?
  end

end