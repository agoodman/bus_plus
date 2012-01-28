require 'test_helper'
require 'shoulda'

class PassengerTest < ActiveSupport::TestCase

  should have_one :segment
  
  should validate_numericality_of :latitude
  should validate_numericality_of :longitude
  
end
