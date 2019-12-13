require_relative 'bike'
require_relative 'van'


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
    working_bikes_array.pop
  end

  def dock(bike)
    raise "No Space" if @bikes if full?
    @bikes << bike
  end

  

  def broken_to_load
    broken = broken_bikes_array
    @bikes -= broken_bikes_array
    broken
  end


  private 

  def full?
    @bikes.length >= @capacity 
  end

  def empty?
    @bikes.empty?
  end

  def broken_bikes_array
    @bikes.select {|bike| bike if bike.broken? }
  end

  def working_bikes_array
    @bikes.reject {|bike| bike if bike.broken? }
  end

end
