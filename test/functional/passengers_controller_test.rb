require 'test_helper'

class PassengersControllerTest < ActionController::TestCase

  context "on get index" do
    setup { get :index }
    should respond_with :success
  end
  
  for format in ['json', 'xml']
    context "on post create as #{format}" do
      setup { post :create, format: format, passenger: { :latitude => 0.0, :longitude => 0.0 } }
    
      should respond_with :succes
    end
  
    context "on put update as #{format}" do
      setup do
        @passenger = Passenger.create({ latitude: 0.0, longitude: 0.0 })
        put :update, format: format, id: @passenger.id, passenger: { latitude: 0.0, longitude: 0.0 }
      end
    
      should respond_with :success
    end
  
    context "on delete destroy" do
      setup do
        @passenger = Passenger.create({ latitude: 0.0, longitude: 0.0 })
        delete :destroy, format: format, id: @passenger.id
      end
    
      should respond_with :success
    end
  end

end
