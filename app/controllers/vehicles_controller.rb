class VehiclesController < ApplicationController

  respond_to :json, :xml
  
  def index
    respond_to do |format|
      format.html { render layout: 'api' }
      format.json { head :forbidden }
      format.xml { head :forbidden }
    end
  end

  def near
    @vehicles = Vehicle.near(params[:latitude].to_f,params[:longitude].to_f)
    respond_to do |format|
      format.json { render json: @vehicles.count, status: :ok }
      format.xml {  render xml: @vehicles.count, status: :ok }
    end
  end
  
  def create
    @vehicle = Vehicle.new(params[:vehicle])
    @vehicle.save
    respond_with(@vehicle)
  end
  
  def show
    respond_with(@vehicle = Vehicle.find(params[:id]))
  end
  
  def update
    @vehicle = Vehicle.find(params[:id])
    
    @vehicle.update_attributes(params[:vehicle])
    respond_with(@vehicle)
  end
  
  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy
    
    head :ok
  end

end
