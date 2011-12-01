require 'test_helper'
require 'shoulda'

class PathElementTest < ActiveSupport::TestCase

  should have_and_belong_to_many :manifests
  should belong_to :passenger
  should validate_presence_of :passenger_id
  should validate_presence_of :start_latitude
  should validate_presence_of :start_longitude
  should validate_presence_of :start_time
  should validate_presence_of :end_latitude
  should validate_presence_of :end_longitude
  should validate_presence_of :end_time
  
end
