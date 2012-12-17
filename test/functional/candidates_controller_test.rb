require 'test_helper'

class CandidatesControllerTest < ActionController::TestCase

  context "on get index" do
    setup { get :index }
    should respond_with :success
  end
  
  for format in ['json', 'xml']
    context "on get index as #{format}" do
      setup { get :index, format: format }
      
      should respond_with :forbidden
    end
    
    context "on post create as #{format}" do
      setup { post :create, format: format, candidate: { passenger_id: 1, vehicle_id: 1 } }
    
      should respond_with :forbidden
    end
  
    context "on get show as #{format}" do
      setup do
        @passenger = FactoryGirl.create(:passenger)
        @driver = FactoryGirl.create(:driver)
        @vehicle = FactoryGirl.create(:vehicle, driver: @driver)
        @candidate = Candidate.create(passenger_id: @passenger.id, vehicle_id: @vehicle.id)
        get :show, format: format, id: @candidate.id
      end
    
      should respond_with :success
    end
  
    context "on put update as #{format}" do
      setup do
        @passenger = FactoryGirl.create(:passenger)
        @driver = FactoryGirl.create(:driver)
        @vehicle = FactoryGirl.create(:vehicle, driver: @driver)
        @candidate = Candidate.create(passenger_id: @passenger.id, vehicle_id: @vehicle.id)
        put :update, format: format, id: @candidate.id, candidate: { bid: 100.0 }
      end
    
      should respond_with :success
    end
  
    context "on delete destroy" do
      setup do
        delete :destroy, format: format, id: 1
      end
    
      should respond_with :forbidden
    end
  end

end
