class Waypoint < ActiveRecord::Base

  has_many :path_elements
  has_many :paths, :through => :path_elements

end
