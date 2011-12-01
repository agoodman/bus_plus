require 'test_helper'
require 'shoulda'

class Passengers::PathElementsControllerTest < ActionController::TestCase

  context "on get index" do
    setup do
      @passenger = Passenger.create(:latitude => 0.0, :longitude => 0.0)
      get :index, :passenger_id => @passenger.id
    end
    
    should respond_with :success
    should assign_to :path_elements
    should render_template :index
  end
      
  context "on get new" do
    setup do
      @passenger = Passenger.create(:latitude => 0.0, :longitude => 0.0)
      get :new, :passenger_id => @passenger.id
    end
    
    should respond_with :success
    should assign_to :path_element
    should render_template :new
  end
  
  context "on post create" do
    setup do
      @passenger = Passenger.create(:latitude => 0.0, :longitude => 0.0)
      post :create, :passenger_id => @passenger.id, :path_element => { :passenger_id => @passenger.id, :start_latitude => 0.0, :start_longitude => 0.0, :start_time => Time.now, :end_latitude => 1.0, :end_longitude => 1.0, :end_time => Time.now + 30.minutes }
    end
    
    should ('redirect to show'){redirect_to passenger_path_element_path(@passenger,assigns(:path_element))}
  end
  
  context "on get show" do
    setup do
      @passenger = Passenger.create(:latitude => 0.0, :longitude => 0.0)
      @path_element = PathElement.create(:passenger_id => @passenger.id, :start_latitude => 0.0, :start_longitude => 0.0, :start_time => Time.now, :end_latitude => 1.0, :end_longitude => 1.0, :end_time => Time.now + 30.minutes)
      get :show, :passenger_id => @passenger.id, :id => @path_element.id
    end
    
    should respond_with :success
    should assign_to :path_element
    should render_template :show
  end
  
  context "on delete destroy" do
    setup do
      @passenger = Passenger.create(:latitude => 0.0, :longitude => 0.0)
      @path_element = PathElement.create(:passenger_id => @passenger.id, :start_latitude => 0.0, :start_longitude => 0.0, :start_time => Time.now, :end_latitude => 1.0, :end_longitude => 1.0, :end_time => Time.now + 30.minutes)
      delete :destroy, :passenger_id => @passenger.id, :id => @path_element.id
    end
    
    should ('redirect to passenger'){redirect_to passenger_path(@passenger)}
  end

end
