class DriversController < ApplicationController

  respond_to :json, :xml
  
  def index
    respond_to do |format|
      format.html
      format.json { head :forbidden }
      format.xml { head :forbidden }
    end
  end

  def show
    respond_with(@driver = Driver.find(params[:id]))
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
    @driver = Driver.find(params[:id])
    @driver.destroy
    
    head :ok
  end

end
