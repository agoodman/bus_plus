class AddDriverIdToVehicles < ActiveRecord::Migration

  def self.up
    add_column :vehicles, :driver_id, :integer
  end

  def self.down
    remove_column :vehicles, :driver_id
  end
  
end
