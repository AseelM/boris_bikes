require "docking_station"

describe DockingStation do

  DEFAULT_CAPACITY = 20

  it "expected to respond to release_bike" do
   is_expected.to respond_to(:release_bike)
  end

  it "returns a bike if available bike is working" do
    double = double(:bike, working?: true)
    subject.dock_bike(double)
    bike = subject.release_bike
    expect(bike).to eq double
  end

  it "returns a message if available bike is not working" do
    subject.dock_bike double(:bike, working?: false)
    bike = subject.release_bike
    expect(bike).to eq 'no working bikes!'
  end

  it "expected to respond to dock_bike" do
     is_expected.to respond_to(:dock_bike)
  end

  it "expected to respond to dock_bike" do
     expect(subject).to respond_to(:dock_bike).with(1).argument
  end

  it "should not dock a bike when capacity is full" do
    (DEFAULT_CAPACITY + 1).times { subject.dock_bike double(:bike)}
    number_of_bikes = subject.bikes.length
    expect(number_of_bikes).to eq DEFAULT_CAPACITY
  end

  it "should not release a bike when one is not available" do
    subject.release_bike
    expect(subject.bike).to eq nil
  end

  it "should return a bike when a working bike is available" do
    double = double(:bike, working?: true)
    subject.dock_bike double
    bike = subject.release_bike
    expect(bike).to eq double
  end

  it "should return instance capacity when passed one" do
    station = DockingStation.new(25)
    expect(station.capacity).to eq 25
  end

  it "should set default capacity when not passed one" do
    expect(subject.capacity).to eq DEFAULT_CAPACITY
  end

end
