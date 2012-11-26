class CandidateSearch
  
  def self.search(passenger_id)
    passenger = Passenger.find(passenger_id)
    nearby_vehicles = Vehicle.with_vacancy.near(passenger.start_latitude, passenger.start_longitude).limit(20)
    if nearby_vehicles.empty?
      puts "no nearby vehicles found for passenger #{passenger_id}"
    else
      for vehicle in nearby_vehicles
        Candidate.create(passenger_id: passenger_id, vehicle_id: vehicle.id)
      end
      CandidateSelect.delay.select(passenger_id)
    end
  end
  
end
