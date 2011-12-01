class Waypoint < ActiveRecord::Base

  belongs_to :manifest
  
  validates_presence_of :manifest_id, :latitude, :longitude, :arrival_time

end
