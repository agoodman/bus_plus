class DestinationsController < ApplicationController

  respond_to :json, :xml
  
  before_filter :assign_passenger, only: :create
  
  def index
  end

  def create
    @segment = Segment.new(
      start_latitude: @passenger.latitude, 
      start_longitude: @passenger.longitude,
      end_latitude: params[:destination][:latitude],
      end_longitude: params[:destination][:longitude]
    )
    @segment.passenger_id = @passenger.id
    if @passenger.segment.blank?
      if @segment.save
        @passenger.segment = @segment
        respond_with(@passenger, include: :segment, status: :ok, location: passenger_path(@passenger))
      else
        # errors = @segment.errors.full_messages
        respond_with(@segment, status: :unprocessable_entity)
      end
    else
      respond_to do |format|
        format.json { render json: { errors: [ "Passenger already has a segment" ] }, status: :unprocessable_entity }
        format.xml { render xml: { errors: [ "Passenger already has a segment" ] }, status: :unprocessable_entity }
      end
    end
  end
  
  def assign_passenger
    @passenger = Passenger.find(params[:passenger_id])
  end

end
