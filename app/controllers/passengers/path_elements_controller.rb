class Passengers::PathElementsController < ApplicationController
  
  before_filter :assign_passenger
  
  def index
    @path_elements = @passenger.path_elements
  end
  
  def new
    @path_element = PathElement.new(:passenger_id => @passenger.id)
  end
  
  def create
    @path_element = PathElement.new(params[:path_element])
    if ! @path_element.save
      flash[:error] = @path_element.errors.full_messages
      render :action => :new
    else
      redirect_to passenger_path_elements_path(@passenger)
    end
  end
  
  def show
    @path_element = PathElement.find(params[:id])
  end
  
  def destroy
    @path_element = PathElement.find(params[:id])
    @path_element.destroy
    redirect_to passenger_path_elements_path(@passenger)
  end
  
  private
  
  def assign_passenger
    @passenger = Passenger.find(params[:passenger_id])
  end
  
end
