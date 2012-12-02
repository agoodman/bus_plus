require 'rest-client'

class PathFollower
  
  attr_accessor :origin, :destination, :vehicle_id
  
  def perform
    # grab leg coords from google directions api
    raw_json = get_directions
    directions = JSON.parse(raw_json)
    start_time = Time.now
    for step in directions["routes"][0]["legs"][0]["steps"]
      next if step["duration"]["value"]<10
      start_time += step["duration"]["value"].seconds
      pinger = VehiclePinger.new
      pinger.lat = step["end_location"]["lat"]
      pinger.lng = step["end_location"]["lng"]
      pinger.vehicle_id = vehicle_id
      pinger.schedule start_at: start_time
    end
  end
  
  def get_directions(format="json")
    url = "http://maps.googleapis.com/maps/api/directions/#{format}?origin=#{origin}&destination=#{destination}&avoid=highways&sensor=false"
    RestClient.get url
  end
  
end
