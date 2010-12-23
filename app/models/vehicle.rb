class Vehicle < ActiveRecord::Base

  belongs_to :driver
  has_one :path
  has_many :occupants
  has_many :passengers, :through => :occupants

end
