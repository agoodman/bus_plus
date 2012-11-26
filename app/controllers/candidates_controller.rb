class CandidatesController < ApplicationController

  respond_to :json, :xml
  
  def index
    respond_to do |format|
      format.html
      format.json { head :forbidden }
      format.xml { head :forbidden }
    end
  end
  
  def create
    head :forbidden
  end
  
  def show
    respond_with(@candidate = Candidate.find(params[:id]))
  end
  
  def update
    @candidate = Candidate.find(params[:id])
    
    if @candidate.update_attributes(params[:candidate])
      respond_with(@candidate, status: :ok)
    else
      respond_with(@candidate, status: :unprocessable_entity)
    end
  end
  
  def destroy
    head :forbidden
  end

end
