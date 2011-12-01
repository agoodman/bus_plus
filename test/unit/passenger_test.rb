require 'test_helper'
require 'shoulda'

class PassengerTest < ActiveSupport::TestCase

  should have_many :path_elements
  
end
