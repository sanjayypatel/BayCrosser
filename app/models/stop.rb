class Stop

  attr_reader :stop_id, :bus_route_id, :trip_id, :name, :latitude, :longitude, :scheduled_time

  def initialize(stop_id, bus_route_id, trip_id, name, latitude, longitude, scheduled_time)
    @stop_id = stop_id
    @bus_route_id = bus_route_id
    @trip_id = trip_id
    @name = name
    @latitude = latitude
    @longitude = longitude
    @scheduled_time = scheduled_time
  end

end