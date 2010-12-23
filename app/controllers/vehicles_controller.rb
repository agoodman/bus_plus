class VehiclesController < ApplicationController

  def index
    @vehicles = Vehicle.all
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(params[:vehicle])
    if ! @vehicle.save
      flash[:error] = @vehicle.errors.full_messages
    end
    redirect_to vehicles_path
  end
  
  def edit
    @vehicle = Vehicle.find(params[:id])
  end
  
  def update
    @vehicle = Vehicle.find(params[:id])
    
    if ! @vehicle.update_attributes(params[:vehicle])
      flash[:error] = @vehicle.errors.full_messages
    end
    redirect_to vehicles_path
  end
  
  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy
    
    redirect_to vehicles_path
  end

end
