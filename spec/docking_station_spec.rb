require "docking_station"

describe DockingStation do

  DEFAULT_CAPACITY = 20

  it "expected to respond to release_bike" do
   is_expected.to respond_to(:release_bike)
  end

  it "returns a bike if available bike is working" do
    station = DockingStation.new
    double = double(:bike, working?: true)
    station.dock_bike(double)
    expect(station.release_bike).to eq double
  end

  it "returns a message if available bike is not working" do
    station = DockingStation.new
    double = double(:bike, working?: false)
    station.dock_bike(double)
    expect(station.release_bike).to eq 'no working bikes!'
  end

  it "expected to respond to dock_bike" do
     is_expected.to respond_to(:dock_bike)
  end

  it "expected to respond to dock_bike" do
     expect(DockingStation.new).to respond_to(:dock_bike).with(1).argument
  end

  it "should not dock a bike when capacity is full" do
    station = DockingStation.new
    double = double(:bike)
    station.dock_bike(double)
    DEFAULT_CAPACITY.times { station.dock_bike(double)}
    expect(station.bikes.length).to eq DEFAULT_CAPACITY
  end

  it "should not release a bike when one is not available" do
    station = DockingStation.new
    station.release_bike
    expect(station.bike).to eq nil
  end

  it "should return a bike when a working bike is available" do
    station = DockingStation.new
    double = double(:bike, working?: true)
    station.dock_bike(double)
    expect(station.release_bike).to eq double
  end

end
