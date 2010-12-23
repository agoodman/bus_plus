class PassengersController < ApplicationController

  def index
    @passengers = Passenger.all
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(params[:passenger])
    
    if ! @passenger.save
      flash[:error] = @passenger.errors.full_messages
    end
    redirect_to passengers_path
  end
  
  def edit
    @passenger = Passenger.find(params[:id])
  end
  
  def update
    @passenger = Passenger.find(params[:id])
    
    if ! @passenger.update_attributes(params[:passenger])
      flash[:error] = @passenger.errors.full_messages
    end
    redirect_to passengers_path
  end
  
  def destroy
    @passenger = Passenger.find(params[:id])
    @passenger.destroy
    
    redirect_to passengers_path
  end

end
