class Api::BaseController < ApplicationController

  respond_to :json, :xml
  
  def error
    respond_to do |format|
      format.json { render json: {errors: "Invalid request"}, status: :not_found }
      format.xml { render xml: {errors: "Invalid request"}, status: :not_found }
    end
  end
  
end
