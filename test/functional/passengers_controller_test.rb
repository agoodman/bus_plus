require 'test_helper'
require 'shoulda'

class PassengersControllerTest < ActionController::TestCase

  context "on get index" do
    setup { get :index }
    
    should respond_with :success
    should assign_to :passengers
  end
  
  context "on get new" do
    setup { get :new }
    
    should respond_with :success
    should assign_to :passenger
    should render_template :new
  end
  
  context "on post create" do
    setup { post :create, :passenger => { :latitude => 0.0, :longitude => 0.0 } }
    
    should ('redirect to index'){redirect_to passengers_path}
  end
  
  context "on put update" do
    setup do
      @passenger = Passenger.create({ :latitude => 0.0, :longitude => 0.0 })
      put :update, :id => @passenger.id, :passenger => { :latitude => 0.0, :longitude => 0.0 }
    end
    
    should ('redirect to index'){redirect_to passengers_path}
  end
  
  context "on delete destroy" do
    setup do
      @passenger = Passenger.create({ :latitude => 0.0, :longitude => 0.0 })
      delete :destroy, :id => @passenger.id
    end
    
    should ('redirect to index'){redirect_to passengers_path}
  end

end
