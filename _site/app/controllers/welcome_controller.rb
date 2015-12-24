class WelcomeController < ApplicationController
  def index
  end

  def connect_to_actransit
    output = ACTransitRails.get_all_routes()
    puts output
    puts output.class
    redirect_to root_path
  end
end
