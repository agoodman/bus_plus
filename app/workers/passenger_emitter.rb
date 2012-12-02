require 'rest-client'

class PassengerEmitter
  
  attr_accessor :origin, :destination

  def perform
    start_lat = origin.split(",")[0]
    start_lng = origin.split(",")[1]
    end_lat = destination.split(",")[0]
    end_lng = destination.split(",")[1]
    api = RestClient::Resource.new "http://buspl.us/api"
    attrs = {
      passenger: { 
        latitude: start_lat, 
        longitude: start_lng 
      }
    }
    raw_json = api["passengers"].post attrs.to_json, accept: "application/json", content_type: "application/json"
    passenger = JSON.parse(raw_json)["passenger"]
    
    attrs = {
      destination: { 
        latitude: end_lat, 
        longitude: end_lng 
      }
    }
    raw_json = api["passengers/#{passenger['id']}/destination"].post attrs.to_json, accept: "application/json", content_type: "application/json"
    segment = JSON.parse(raw_json)["segment"]
  end
  
end
