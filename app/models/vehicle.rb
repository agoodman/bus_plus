class Vehicle < ActiveRecord::Base

  belongs_to :driver
  has_many :segments
  has_many :passengers, :through => :segments
  
  validates_presence_of :latitude, :longitude
  validates_numericality_of :latitude, :longitude

end
