class DockingStation

  DEFAULT_CAPACITY = 20
  attr_reader :bike, :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    if empty?
    else
      @bike.working? ? @bike : 'no working bikes!'
    end
  end

  def dock_bike(bike)
    unless full?
      @bike = bike
      @bikes.push(@bike)
    end
  end

private

  def empty?
    if @bikes.count == 0
      p 'No bikes available'
      true
    end
  end

  def full?
    if @bikes.count >= DEFAULT_CAPACITY
      p 'Docking station is full!'
      true
    end
  end

end
