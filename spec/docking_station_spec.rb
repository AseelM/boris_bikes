require "docking_station"

describe DockingStation do

  it "expected to respond to release_bike" do
   is_expected.to respond_to(:release_bike)
  end

  it "returns a bike if available bike is working" do
    station = DockingStation.new
    double = double(:bike, working?: true)
    station.dock_bike(double)
    expect(station.release_bike).to eq double
  end

  it "returns a bike if available bike is not working" do
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

  it "should raise an error when docking_station is full" do
    station = DockingStation.new
    double = double(:bike, working?: true)
    21.times { station.dock_bike(double)}
    expect(station.bikes.length).to eq 20
  end

  it "should raise an error when bikes are not available" do
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
