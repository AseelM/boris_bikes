class DockingStation

  attr_reader :bike
  attr_reader :bikes

  def initialize
    @bikes = []
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
    if @bikes.length == 0
      puts 'No bikes available'
      true
    end
  end

  def full?
    if @bikes.length >= 20
      puts 'Docking station is full!'
      true
    end
  end

end
