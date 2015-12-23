module BusRoutesHelper
  def google_maps_embed(latitude, longitude)
    output = "<iframe width='400' height='400' frameborder='0' style='border:0' src='https://www.google.com/maps/embed/v1/place?q=" 
    output += latitude.to_s 
    output += "%2C%20" 
    output += longitude.to_s 
    output += "&key=" 
    output += ENV['GOOGLE_MAPS_API_KEY'] 
    output += "' allowfullscreen></iframe>"
    return output.html_safe
  end
end