class AddBusRouteToStop < ActiveRecord::Migration
  def change
    add_reference :stops, :bus_route, index: true, foreign_key: true
  end
end
