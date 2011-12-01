require 'test_helper'
require 'shoulda'

class ManifestTest < ActiveSupport::TestCase

  should belong_to :vehicle
  should have_many :waypoints
  should have_many :passengers
  should have_and_belong_to_many :path_elements
  
  should validate_presence_of :vehicle_id
  
end
