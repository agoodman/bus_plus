class PathElement < ActiveRecord::Base
  
  has_and_belongs_to_many :manifests
  belongs_to :passenger
  
  validates_presence_of :passenger_id, :start_latitude, :start_longitude, :start_time, :end_latitude, :end_longitude, :end_time
  
end
