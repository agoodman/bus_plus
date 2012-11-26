require 'test_helper'

class PassengersControllerTest < ActionController::TestCase

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
      setup { post :create, format: format, passenger: FactoryGirl.attributes_for(:passenger) }
    
      should respond_with :created
    end
  
    context "on get show as #{format}" do
      setup do
        @passenger = FactoryGirl.create(:passenger)
        get :show, format: format, id: @passenger.id
      end
    
      should respond_with :success
    end
  
    context "on put update as #{format}" do
      setup do
        @passenger = FactoryGirl.create(:passenger)
        put :update, format: format, id: @passenger.id, passenger: {}
      end
    
      should respond_with :forbidden
    end
  
    context "on delete destroy" do
      setup do
        @passenger = FactoryGirl.create(:passenger)
        delete :destroy, format: format, id: @passenger.id
      end
    
      should respond_with :success
    end
  end

end
