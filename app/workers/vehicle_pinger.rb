require 'rest-client'

class VehiclePinger
  
  attr_accessor :lat, :lng, :vehicle_id
  
  def perform
    RestClient.put "http://buspl.us/api/vehicles/#{vehicle_id}", vehicle: { latitude: lat, longitude: lng }
  end
  
end
