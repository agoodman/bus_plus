require 'test_helper'
require 'shoulda'

class DriverTest < ActiveSupport::TestCase

  should have_one :vehicle
  
end
