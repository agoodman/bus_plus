class Passenger < ActiveRecord::Base

  has_one :path
  
  after_create :init_path

  def init_path
    self.build_path
  end
  
end
