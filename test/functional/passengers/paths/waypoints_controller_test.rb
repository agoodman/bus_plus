require 'test_helper'
require 'shoulda'

class Passengers::Paths::WaypointsControllerTest < ActionController::TestCase

  context "on get new" do
    setup do
      @passenger = Passenger.create(:latitude => 0.0, :longitude => 0.0)
      get :new, :passenger_id => @passenger.id
    end
    
    should respond_with :success
    should assign_to :waypoint
    should render_template :new
  end
  
  context "on post create" do
    setup do
      @passenger = Passenger.create(:latitude => 0.0, :longitude => 0.0)
      post :create, :passenger_id => @passenger.id, :waypoint => { :latitude => 0.0, :longitude => 0.0, :arrival_time => Time.now }
    end
    
    should ('redirect to path'){redirect_to passenger_path_path(@passenger)}
  end
  
  context "on put update" do
    setup do
      @passenger = Passenger.create(:latitude => 0.0, :longitude => 0.0)
      @waypoint = Waypoint.create(:latitude => 0.0, :longitude => 0.0, :arrival_time => Time.now)
      PathElement.create(:path_id => @passenger.path.id, :waypoint_id => @waypoint.id)
      put :update, :passenger_id => @passenger.id, :id => @waypoint.id, :waypoint => { :arrival_time => Time.now + 10.minutes }
    end
    
    should ('redirect to path'){redirect_to passenger_path_path(@passenger)}
  end
  
  context "on delete destroy" do
    setup do
      @passenger = Passenger.create(:latitude => 0.0, :longitude => 0.0)
      @waypoint = Waypoint.create(:latitude => 0.0, :longitude => 0.0, :arrival_time => Time.now)
      PathElement.create(:path_id => @passenger.path.id, :waypoint_id => @waypoint.id)
      delete :destroy, :passenger_id => @passenger.id, :id => @waypoint.id
    end

    should ('redirect to path'){redirect_to passenger_path_path(@passenger)}
  end
  
end
