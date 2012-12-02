class Driver < ActiveRecord::Base

  has_one :vehicle, dependent: :destroy

  attr_accessible :email, :license_number
  
  validates_presence_of :email, :license_number
  validates_uniqueness_of :email
  validates_uniqueness_of :license_number, scope: :email

end
