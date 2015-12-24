Rails.application.routes.draw do
  resources :bus_routes do
    resources :trips
  end
  root to: 'welcome#index'
  get "connect" => "welcome#connect_to_actransit", :as => "connect_to_actransit"
  get "refresh" => "bus_routes#refresh_bus_routes", :as => "refresh_bus_routes"
end
