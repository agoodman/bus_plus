class SegmentMatcher
  
  attr_accessor :segment
  
  def perform
    vehicles = Vehicle.where('latitude >= ?',segment.passenger.latitude).
      where('latitude < ?',segment.passenger.latitude+0.1).
      where('longitude >= ?',segment.passenger.longitude).
      where('longitude < ?',segment.passenger.longitude+0.1).
      limit(25)
      
    for vehicle in vehicles
      Candidate.create(vehicle_id: vehicle.id, passenger_id: segment.passenger_id)
    end
  end
  
end
