class Passenger < ActiveRecord::Base

  has_many :candidates, dependent: :destroy
  belongs_to :vehicle
  
  validates_presence_of :start_latitude, :start_longitude, :end_latitude, :end_longitude, :token
  validates_numericality_of :start_latitude, :start_longitude, :end_latitude, :end_longitude

  attr_accessible :start_latitude, :start_longitude, :end_latitude, :end_longitude, :position, :token
  
  after_create :find_candidates
  before_destroy :release_from_vehicle
  
  def find_candidates
    CandidateSearch.delay.search(id)
  end

  def assign!(assigned_vehicle_id)
    puts "assigned passenger #{id} to vehicle #{assigned_vehicle_id}"
    self.assigned_at = Time.now
    self.vehicle_id = assigned_vehicle_id
    self.save
  end

  def release_from_vehicle
    vehicle.increment_seat_count! unless vehicle.nil?
  end
  
end
