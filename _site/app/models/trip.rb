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
      return "Weekday"
    when 5
      return "Saturday"
    when 6
      return "Sunday"
    end
  end

  def start_time_to_s
    return DateTime.parse(start_time).strftime("%I:%M %p")
  end

end