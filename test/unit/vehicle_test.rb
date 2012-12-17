require 'test_helper'
require 'shoulda'

class VehicleTest < ActiveSupport::TestCase

  should belong_to :driver
  should have_many :passengers
  should have_many :candidates
  
  should validate_presence_of :latitude
  should validate_presence_of :longitude
  should validate_numericality_of :latitude
  should validate_numericality_of :longitude

  context "a vehicle with one seat available on decrement" do
    setup do
      @driver = FactoryGirl.create(:driver)
      @vehicle = FactoryGirl.create(:vehicle, seats_available: 1, driver: @driver)
      @vehicle.decrement_seat_count!
    end
    should "have no seats available" do
      assert_equal(@vehicle.seats_available, 0)
    end
  end
  
  context "a vehicle with no seats available on increment" do
    setup do
      @driver = FactoryGirl.create(:driver)
      @vehicle = FactoryGirl.create(:vehicle, seats_available: 0, driver: @driver)
      @vehicle.increment_seat_count!
    end
    should "have one seat available" do
      assert_equal(@vehicle.seats_available, 1)
    end
  end
  
end
