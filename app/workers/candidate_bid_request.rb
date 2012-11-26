class CandidateBidRequest
  
  def self.send_bid_request(candidate_id)
    puts "TODO: send APNs bid request to candidate #{candidate_id}"
    # TODO grocer integration
    # for now, just schedule a callback 5sec later
    CandidateBidRequestStub.delay(run_at: 5.seconds.from_now).callback(candidate_id)
  end
  
end
