class Passengers::Paths::WaypointsController < ApplicationController
  
  def new
    @passenger = Passenger.find(params[:passenger_id])
    @waypoint = Waypoint.new
  end
  
  def create
    @passenger = Passenger.find(params[:passenger_id])
    @waypoint = Waypoint.new(params[:waypoint])
    
    if @waypoint.save
      PathElement.create(:path_id => @passenger.path.id, :waypoint_id => @waypoint.id)
    else
      flash[:error] = @waypoint.errors.full_messages
    end
    redirect_to passenger_path_path(@passenger)
  end
  
  def update
    @passenger = Passenger.find(params[:passenger_id])
    @waypoint = Waypoint.find(params[:id])
    if ! @waypoint.update_attributes(params[:waypoint])
      flash[:error] = @waypoint.errors.full_messages
    end
    redirect_to passenger_path_path(@passenger)
  end

  def destroy
    @passenger = Passenger.find(params[:passenger_id])
    @waypoint = Waypoint.find(params[:id])
    @waypoint.destroy
    redirect_to passenger_path_path(@passenger)
  end
  
end
