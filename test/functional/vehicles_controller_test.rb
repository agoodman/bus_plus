require 'test_helper'
require 'shoulda'

class VehiclesControllerTest < ActionController::TestCase

  context "on get index" do
    setup { get :index }
    
    should respond_with :success
    should assign_to :vehicles
  end
  
  context "on get new" do
    setup { get :new }
    
    should respond_with :success
    should assign_to :vehicle
    should render_template :new
  end
  
  context "on post create" do
    setup { post :create, :vehicle => { :latitude => 0.0, :longitude => 0.0 } }
    
    should ('redirect to index'){redirect_to vehicles_path}
  end
  
  context "on put update" do
    setup do
      @vehicle = Vehicle.create({ :latitude => 0.0, :longitude => 0.0 })
      put :update, :id => @vehicle.id, :vehicle => { :latitude => 0.0, :longitude => 0.0 }
    end
    
    should ('redirect to index'){redirect_to vehicles_path}
  end
  
  context "on delete destroy" do
    setup do
      @vehicle = Vehicle.create({ :latitude => 0.0, :longitude => 0.0 })
      delete :destroy, :id => @vehicle.id
    end
    
    should ('redirect to index'){redirect_to vehicles_path}
  end
  
end
