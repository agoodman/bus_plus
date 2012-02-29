class VehiclesController < ApplicationController

  respond_to :json, :xml
  
  def index
    @vehicles = Vehicle.all
  end

  def create
    @vehicle = Vehicle.new(params[:vehicle])
    if @vehicle.save
      respond_with(@vehicle, status: :ok)
    else
      respond_with(@vehicle, status: :unprocessable_entity)
    end
  end
  
  def show
    respond_with(@vehicle = Vehicle.find(params[:id]))
  end
  
  def update
    @vehicle = Vehicle.find(params[:id])
    
    if @vehicle.update_attributes(params[:vehicle])
      respond_with(@vehicle, status: :ok)
    else
      respond_with(@vehicle, status: :unprocessable_entity)
    end
  end
  
  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy
    
    head :ok
  end

end
