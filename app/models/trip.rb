class Trip

  attr_reader :trip_id, :bus_route_id, :schedule_type, :start_time, :direction

  def initialize(trip_id, bus_route_id, schedule_type, start_time, direction)
    @trip_id = trip_id
    @bus_route_id = bus_route_id
    @schedule_type = schedule_type
    @start_time = start_time
    @direction = direction
  end

  def schedule_type_to_s
    case schedule_type
    when 0
      return "M-F"
    when 5
      return "Sa"
    when 6
      return "Su"
    end
  end

  def start_time_to_s
    return DateTime.parse(start_time).strftime("%I:%M %p")
  end

  def direction_to_s
    bus_route = BusRoute.find(self.bus_route_id)
    if self.direction == "Westbound"
      direction = "To SF"
    else
      direction = "To #{bus_route.description_to_s}"
    end
    return direction
  end

end