class AddDirectionBToBusRoutes < ActiveRecord::Migration
  def change
    add_column :bus_routes, :direction_b, :string
  end
end
