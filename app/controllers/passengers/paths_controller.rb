class Passengers::PathsController < ApplicationController

  def show
    @passenger = Passenger.find(params[:passenger_id])
    @path = @passenger.path
  end

end
