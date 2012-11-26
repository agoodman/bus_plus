class PassengersController < ApplicationController

  respond_to :json, :xml
  
  def index
    respond_to do |format|
      format.html
      format.json { head :forbidden }
      format.xml { head :forbidden }
    end
  end

  def create
    @passenger = Passenger.new(params[:passenger])
    
    @passenger.save
    respond_with(@passenger)
  end

  def show
    respond_with(@passenger = Passenger.find(params[:id]))
  end
  
  def update
    head :forbidden
  end
  
  def destroy
    @passenger = Passenger.find(params[:id])
    @passenger.destroy
    
    head :ok
  end

end
