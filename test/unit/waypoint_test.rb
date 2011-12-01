require 'test_helper'
require 'shoulda'

class WaypointTest < ActiveSupport::TestCase

  should belong_to :manifest
  should validate_presence_of :latitude
  should validate_presence_of :longitude
  should validate_presence_of :arrival_time
  
end
