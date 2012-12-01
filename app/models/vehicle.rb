class Vehicle < ActiveRecord::Base

  belongs_to :driver
  has_many :passengers, order: 'position asc'
  has_many :candidates, dependent: :destroy
  
  validates_presence_of :latitude, :longitude, :token
  validates_numericality_of :latitude, :longitude

  attr_accessible :latitude, :longitude, :driver_id, :seats_available, :on_duty, :token
  
  scope :with_vacancy, where('seats_available > 0')
  
  def waypoints
    passengers.map {|s| [[s.start_latitude,s.start_longitude],[s.end_latitude,s.end_longitude]]}.flatten
  end

  def decrement_seat_count!
    self.update_attributes(seats_available: seats_available-1)
  end
  
  def increment_seat_count!
    self.update_attributes(seats_available: seats_available+1)
  end
  
end
