require 'rest-client'

class CandidateBidRequestStub
  
  def self.callback(candidate_id)
    api = RestClient::Resource.new "http://local:3000/api"
    attrs = {
      candidate: { 
        bid: bid
      }
    }
    raw_json = api["candidates/#{candidate_id}"].put attrs.to_json, accept: "application/json", content_type: "application/json"
  end
  
  def self.bid
    100.0
  end
  
end
