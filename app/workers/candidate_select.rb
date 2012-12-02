class CandidateSelect
  
  def self.select(passenger_id,retry_count=0)
    candidates = Candidate.unassigned.where(passenger_id: passenger_id).order('bid asc')
    if candidates.empty?
      puts "waited 5sec for bids, found none"
      # candidate vehicles have not submitted bids; attempt retry
      if retry_count<5
        puts "retrying in 5sec"
        # only retry five times
        self.delay(run_at: 5.seconds.from_now).select(passenger_id,retry_count+1)
      end
    else
      candidate = candidates[candidates.size/2]
      candidate.assign!
      puts "candidate #{candidate.id} assigned"
    end
  end
  
end
