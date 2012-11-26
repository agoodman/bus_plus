require 'test_helper'

class CandidateTest < ActiveSupport::TestCase

  should belong_to :passenger
  should belong_to :vehicle
  
  should validate_presence_of :passenger_id
  should validate_presence_of :vehicle_id

end
