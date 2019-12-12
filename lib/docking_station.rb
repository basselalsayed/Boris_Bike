require_relative "bike"

class DockingStation
  attr_reader :bikes 
  attr_accessor :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    raise 'No bikes available' if @bikes if empty?
    raise 'No working bikes available' if @bikes.select {|bike| !bike.broken? }.empty?
    @bikes.select {|bike| bike if !bike.broken? }.pop

  end

  def dock(bike)
    raise "No Space" if @bikes if full?
    @bikes << bike
  end

  private 

  def full?
    @bikes.length >= @capacity 
  end

  def empty?
    @bikes.empty?
  end



end
