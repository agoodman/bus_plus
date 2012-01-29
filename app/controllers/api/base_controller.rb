class Api::BaseController < ApplicationController

  respond_to :json, :xml
  
  def error
    respond_with({errors: "Invalid request"}, status: :not_found)  
  end
  
end
