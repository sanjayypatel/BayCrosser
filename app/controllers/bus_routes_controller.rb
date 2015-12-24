class BusRoutesController < ApplicationController
  ACTransitRails.configure(ENV['ACTRANSIT_TOKEN'])

  def index
    @bus_routes = BusRoute.all
  end

  def show
    @bus_route = BusRoute.find(params[:id])
    @fetched_trips = ACTransitRails.get_trips(@bus_route.name)
    @trip_array = []
    @fetched_trips.each do |trip_hash|
      if params[:direction]
        @direction = params[:direction]
        if params[:direction] == trip_hash["Direction"]
          new_trip = Trip.new(
            trip_hash["TripId"],
            @bus_route.id,
            trip_hash["ScheduleType"],
            trip_hash["StartTime"],
            trip_hash["Direction"]
          )
          @trip_array << new_trip
        end
      else
        @direction = "#{@bus_route.direction_a} \& #{@bus_route.direction_b}"
        new_trip = Trip.new(
          trip_hash["TripId"],
          @bus_route.id,
          trip_hash["ScheduleType"],
          trip_hash["StartTime"],
          trip_hash["Direction"]
        )
        @trip_array << new_trip
      end
    end
    @trip_array.sort_by!{|x| [x.direction, x.schedule_type, x.start_time]}
  end

  def create
    @bus_route = BusRoute.new(bus_route_params)
    @bus_route.save
    redirect_to bus_routes_path
  end

  def refresh_bus_routes
    fetched_routes = ACTransitRails.get_all_routes
    fetched_routes.each do |route|
      if route["Description"].starts_with?("San Francisco -")
        bus_route = BusRoute.where(name: route["Name"]).first
        if bus_route.nil?
          fetched_directions = ACTransitRails.get_directions(route["Name"])
          new_bus_route = BusRoute.new(
            name: route["Name"], 
            description: route["Description"],
            direction_a: fetched_directions[0],
            direction_b: fetched_directions[1]
          )
          new_bus_route.save
          # fetched_stops = ACTransitRails.get_stops(new_bus_route.name)
          # fetched_stops.each do |stop|
          #   puts "Fetched Stop #{stop}"
          #   new_stop = Stop.new(name: stop["Name"], stop_id: stop["StopId"], latitude: stop["Latitude"], longitude: stop["Longitude"], bus_route: new_bus_route)
          #   new_stop.save
          # end
        end
      end
    end
    redirect_to(request.referrer || root_path)
  end

  private

  def bus_route_params
    params.require(:bus_route).permit(:name, :description)
  end

end