require 'test_helper'

class DriversControllerTest < ActionController::TestCase

  context "on get index" do
    setup { get :index }
    should respond_with :success
  end
  
  for format in ['json', 'xml']
    context "on post create as #{format}" do
      setup { post :create, format: format, driver: Factory.attributes_for(:driver) }
    
      should respond_with :succes
    end
  
    context "on put update as #{format}" do
      setup do
        @driver = Factory(:driver)
        put :update, format: format, id: @driver.id, driver: Factory.attributes_for(:driver)
      end
    
      should respond_with :success
    end
  
    context "on delete destroy" do
      setup do
        @driver = Factory(:driver)
        delete :destroy, format: format, id: @driver.id
      end
    
      should respond_with :success
    end
  end

end
