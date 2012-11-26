require 'test_helper'

class DriversControllerTest < ActionController::TestCase

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
      setup { post :create, format: format, driver: FactoryGirl.attributes_for(:driver) }
    
      should respond_with :success
    end
  
    context "on get show as #{format}" do
      setup do
        @driver = FactoryGirl.create(:driver)
        get :show, format: format, id: @driver.id
      end
    
      should respond_with :success
    end
  
    context "on put update as #{format}" do
      setup do
        @driver = FactoryGirl.create(:driver)
        put :update, format: format, id: @driver.id, driver: FactoryGirl.attributes_for(:driver)
      end
    
      should respond_with :success
    end
  
    context "on delete destroy" do
      setup do
        @driver = FactoryGirl.create(:driver)
        delete :destroy, format: format, id: @driver.id
      end
    
      should respond_with :success
    end
  end

end
