class CandidateSearch
  
  def self.search(passenger_id)
    passenger = Passenger.find(passenger_id)
    nearby_vehicles = Vehicle.on_duty.with_vacancy.near(passenger.start_latitude, passenger.start_longitude).limit(20)
    if nearby_vehicles.empty?
      puts "no nearby vehicles found for passenger #{passenger_id}"
      PassengerReject.delay.reject(passenger.token)
    else
      for vehicle in nearby_vehicles
        puts "found candidate vehicle #{vehicle.id}"
        Candidate.create(passenger_id: passenger_id, vehicle_id: vehicle.id)
      end
      CandidateSelect.delay(run_at: 5.seconds.from_now).select(passenger_id)
    end
  end
  
end
