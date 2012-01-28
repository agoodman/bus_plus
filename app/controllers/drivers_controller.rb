class DriversController < ApplicationController

  respond_to :json, :xml
  
  def index
  end

  def create
    @driver = Driver.new(params[:driver])
    if @driver.save
      respond_with(@driver, status: :ok)
    else
      respond_with({errors: @driver.errors.full_messages})
    end
  end
  
  def update
    @driver = Driver.find(params[:id])
    
    if @driver.update_attributes(params[:driver])
      respond_with(@driver, status: :ok)
    else
      respond_with({errors: @driver.errors.full_messages})
    end
  end
  
  def destroy
    @driver = Vehicle.find(params[:id])
    @driver.destroy
    
    head :ok
  end

end
