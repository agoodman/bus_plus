require 'test_helper'
require 'shoulda'

class Passengers::PathsControllerTest < ActionController::TestCase

  context "on get show" do
    setup do
      @passenger = Passenger.create(:latitude => 0.0, :longitude => 0.0)
      @path = Path.create(:passenger_id => @passenger_id)
      get :show, :passenger_id => @passenger.id
    end
    
    should respond_with :success
    should assign_to :path
    should render_template :edit
  end

end
