class Vehicle < ActiveRecord::Base

  belongs_to :driver
  has_one :manifest
  has_many :passengers, :through => :manifest
  has_many :waypoints, :through => :manifest
  
  validates_presence_of :latitude, :longitude

end
