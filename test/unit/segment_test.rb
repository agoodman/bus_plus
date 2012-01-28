require 'test_helper'

class SegmentTest < ActiveSupport::TestCase

  should belong_to :vehicle
  should belong_to :passenger
  should validate_presence_of :passenger_id
  should validate_presence_of :start_latitude
  should validate_presence_of :start_longitude
  should validate_presence_of :start_time
  should validate_presence_of :end_latitude
  should validate_presence_of :end_longitude
  should validate_presence_of :end_time
  
end
