class Manifest < ActiveRecord::Base
  
  belongs_to :vehicle
  has_many :waypoints, :order => 'arrival_time'
  has_and_belongs_to_many :path_elements
  has_many :passengers, :through => :path_elements

  validates_presence_of :vehicle_id
  
end
