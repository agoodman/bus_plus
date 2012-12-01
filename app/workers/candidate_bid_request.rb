class CandidateBidRequest
  
  def self.send_bid_request(candidate_id)
    puts "send APNs bid request to candidate #{candidate_id}"
    
    send_bid_request candidate_id
  end
  
  def self.send_bid_request(candidate_id)
    pusher = Grocer.pusher(
      certificate: "config/apns/driver-development.pem",
      gateway: "gateway.sandbox.push.apple.com"
    )
    
    candidate = Candidate.find(candidate_id)
    payload = { candidate_id: candidate_id }
    notification = Grocer::Notification.new(
      device_token: candidate.vehicle.token,
      badge: '1',
      custom: payload
    )
    
    pusher.push(notification)
  end
  
end
