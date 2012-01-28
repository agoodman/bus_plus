require 'test_helper'

class SegmentsControllerTest < ActionController::TestCase

  context "on get index" do
    setup { get :index }
    should respond_with :success
  end
  
  for format in ['json', 'xml']
    context "on post create as #{format}" do
      setup do
        @passenger = Factory(:passenger)
        post :create, format: format, passenger_id: @passenger.id, segment: Factory.attributes_for(:segment)
      end
    
      should respond_with :succes
    end
  
    context "on put update as #{format}" do
      setup do
        @passenger = Factory(:passenger)
        @segment = Factory(:segment)
        put :update, format: format, passenger_id: @passenger.id, id: @segment.id, segment: Factory.attributes_for(:segment)
      end
    
      should respond_with :success
    end
  
    context "on delete destroy" do
      setup do
        @passenger = Factory(:passenger)
        @segment = Factory(:segment)
        delete :destroy, format: format, passenger_id: @passenger.id, id: @segment.id
      end
    
      should respond_with :success
    end
  end

end
