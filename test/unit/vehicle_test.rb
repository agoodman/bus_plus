require 'test_helper'
require 'shoulda'

class VehicleTest < ActiveSupport::TestCase

  should belong_to :driver
  should have_many :segments
  should have_many :passengers
  
  should validate_presence_of :latitude
  should validate_presence_of :longitude
  should validate_numericality_of :latitude
  should validate_numericality_of :longitude
  
end
