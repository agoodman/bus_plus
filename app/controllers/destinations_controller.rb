class DestinationsController < ApplicationController

  respond_to :json, :xml
  
  before_filter :assign_passenger, only: :create
  
  def index
  end

  def create
    @segment = Segment.new(params[:segment])
    @segment.passenger_id = @passenger.id
    if @passenger.segment.blank?
      if @segment.save
        respond_with(@passenger, status: :ok, location: passenger_path(@passenger))
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
