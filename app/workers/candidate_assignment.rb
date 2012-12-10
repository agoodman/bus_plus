class CandidateAssignment

  def self.send_assignment(passenger_id,vehicle_id)
    puts "send APNs assignment to passenger #{passenger_id} and vehicle #{vehicle_id}"
    passenger = Passenger.find(passenger_id)
    vehicle = Vehicle.find(vehicle_id)
    send_passenger_assignment_notification(passenger,vehicle)
    send_vehicle_assignment_notification(passenger,vehicle)
  end

  def self.send_passenger_assignment_notification(passenger,vehicle)
    pusher = Grocer.pusher(
      certificate: "config/apns/passenger-development.pem",
      gateway: "gateway.sandbox.push.apple.com"
    )
      
    payload = { vehicle_id: vehicle.id }
    notification = Grocer::Notification.new(
      device_token: passenger.token,
      alert: 'You have been assigned to a vehicle.',
      custom: payload
    )

    pusher.push(notification)
  end
  
  def self.send_vehicle_assignment_notification(passenger,vehicle)
    pusher = Grocer.pusher(
      certificate: "config/apns/driver-development.pem",
      gateway: "gateway.sandbox.push.apple.com"
    )
      
    payload = { passenger_id: passenger.id }
    notification = Grocer::Notification.new(
      device_token: vehicle.token,
      alert: 'You have been assigned a new passenger.',
      custom: payload
    )

    pusher.push(notification)
  end
  
end
