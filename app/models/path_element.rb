class PathElement < ActiveRecord::Base
  
  belongs_to :path
  belongs_to :waypoint
  
end
