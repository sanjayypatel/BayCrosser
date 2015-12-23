class AddDirectionAToBusRoutes < ActiveRecord::Migration
  def change
    add_column :bus_routes, :direction_a, :string
  end
end
