require 'test_helper'
require 'shoulda'

class PassengerTest < ActiveSupport::TestCase

  should belong_to :vehicle
  should have_many :candidates
  
  should validate_numericality_of :start_latitude
  should validate_numericality_of :start_longitude
  should validate_numericality_of :end_latitude
  should validate_numericality_of :end_longitude
  
end
