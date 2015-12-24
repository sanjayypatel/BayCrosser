class TripsController < ApplicationController
  # ACTransitRails.configure(ENV['ACTRANSIT_TOKEN'])

  def show
    @bus_route = BusRoute.find(params[:bus_route_id])
    fetched_trips = ACTransitRails.get_trips(@bus_route.name)
    puts ">>>>> >>>>>#{fetched_trips}"
    trip_hash = fetched_trips.detect{|trip| trip["TripId"] == params[:id].to_i}
    puts ">>>>>#{trip_hash}"
    @trip = Trip.new(
      trip_hash["TripId"],
      @bus_route.id,
      trip_hash["ScheduleType"],
      trip_hash["StartTime"],
      trip_hash["Direction"]
    )
    fetched_stops = ACTransitRails.get_stops(@bus_route.name, params[:id])
    puts ">>>>> >>>>> >>>>> #{fetched_stops}"
    @stops_array = []
    # fetched_trips_stops.each do |stop|
    #   new_stop = Stop.new(name: stop["Name"], stop_id: stop["StopId"], latitude: stop["Latitude"], longitude: stop["Longitude"], bus_route: new_bus_route)
    #   @stops_array << new_stop
    # end
  end

end