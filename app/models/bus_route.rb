class BusRoute < ActiveRecord::Base

  def description_to_s
    description_string = self.description
    description_string.slice!("San Francisco - ")
    return description_string
  end

end