class PassengersController < ApplicationController

  respond_to :json, :xml
  
  def index
  end

  def create
    @passenger = Passenger.new(params[:passenger])
    
    if @passenger.save
      respond_with(@passenger, status: :ok)
    else
      respond_with({errors: @passenger.errors.full_messages}, status: :unprocessable_entity)
    end
  end
  
  def update
    @passenger = Passenger.find(params[:id])
    
    if @passenger.update_attributes(params[:passenger])
      respond_with(@passenger, status: :ok)
    else
      respond_with({errors: @passenger.errors.full_messages})
    end
  end
  
  def destroy
    @passenger = Passenger.find(params[:id])
    @passenger.destroy
    
    head :ok
  end

end
