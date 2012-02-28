class Passenger < ActiveRecord::Base

  has_one :segment, dependent: :destroy
  
  validates_presence_of :latitude, :longitude
  validates_numericality_of :latitude, :longitude

end
