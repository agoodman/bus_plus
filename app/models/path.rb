class Path < ActiveRecord::Base
  
  belongs_to :passenger
  has_many :path_elements
  has_many :waypoints, :through => :path_elements, :order => 'arrival_time'

end
