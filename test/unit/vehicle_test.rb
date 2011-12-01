require 'test_helper'
require 'shoulda'

class VehicleTest < ActiveSupport::TestCase

  should belong_to :driver
  should have_one :manifest
  should have_many :passengers
  should have_many :waypoints
  
  should validate_presence_of :latitude
  should validate_presence_of :longitude
  
end
