class SegmentsController < ApplicationController

  respond_to :json, :xml
  
  before_filter :assign_passenger, only: [ :create, :update, :destroy ]
  
  def index
  end

  def create
    @segment = Segment.new(params[:segment])
    @segment.passenger_id = @passenger.id
    
    if @segment.save
      respond_with(@segment, status: :ok)
    else
      respond_with({errors: @passenger.errors.full_messages}, status: :unprocessable_entity)
    end
  end
  
  def update
    @segment = Segment.find(params[:id])
    
    if @segment.update_attributes(params[:segment])
      respond_with(@segment, status: :ok)
    else
      respond_with({errors: @segment.errors.full_messages})
    end
  end
  
  def destroy
    @segment = Segment.find(params[:id])
    @passenger.destroy
    
    head :ok
  end
  
  def assign_passenger
    @passenger = Passenger.find(params[:passenger_id])
  end

end
