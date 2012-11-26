require 'test_helper'

class VehiclesControllerTest < ActionController::TestCase

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
      setup do
        @driver = FactoryGirl.create(:driver)
        post :create, format: format, vehicle: FactoryGirl.attributes_for(:vehicle, driver_id: @driver.id)
      end
    
      should respond_with :created
    end
  
    context "on get show as #{format}" do
      setup do
        @driver = FactoryGirl.create(:driver)
        @vehicle = FactoryGirl.create(:vehicle, driver: @driver)
        get :show, format: format, id: @vehicle.id
      end
    
      should respond_with :success
    end
  
    context "on put update as #{format}" do
      setup do
        @driver = FactoryGirl.create(:driver)
        @vehicle = FactoryGirl.create(:vehicle, driver: @driver)
        put :update, format: format, id: @vehicle.id, vehicle: FactoryGirl.attributes_for(:vehicle)
      end
    
      should respond_with :success
    end
  
    context "on delete destroy" do
      setup do
        @driver = FactoryGirl.create(:driver)
        @vehicle = FactoryGirl.create(:vehicle, driver: @driver)
        delete :destroy, format: format, id: @vehicle.id
      end
    
      should respond_with :success
    end
  end

end
