class Segment < ActiveRecord::Base
  
  belongs_to :vehicle
  belongs_to :passenger
  
  validates_presence_of :passenger_id, :start_latitude, :start_longitude, :start_time, :end_latitude, :end_longitude, :end_time
  validates_numericality_of :start_latitude, :start_longitude, :end_latitude, :end_longitude
  
end