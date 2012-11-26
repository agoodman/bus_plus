class Candidate < ActiveRecord::Base

  belongs_to :passenger
  belongs_to :vehicle
  
  validates_presence_of :passenger_id, :vehicle_id
  validates :bid, numericality: true, allow_nil: true
  
  attr_accessible :passenger_id, :vehicle_id, :bid, :assigned_at

  after_create :send_bid_request
  after_update :send_assignment, unless: Proc.new {|e| e.assigned_at.blank?}
  
  scope :pending_bid, where(bid: nil)
  scope :unassigned, where('bid is not null').where(assigned_at: nil)
  scope :assigned, where('assigned_at is not null')
  
  def send_bid_request
    CandidateBidRequest.delay.send_bid_request(id)
  end

  def send_assignment
    CandidateAssignment.delay.send_assignment(passenger_id, vehicle_id)
  end

  def assign!
    passenger.assign! vehicle_id
    vehicle.decrement_seat_count!
    self.update_attributes(assigned_at: Time.now)
  end
  
end
