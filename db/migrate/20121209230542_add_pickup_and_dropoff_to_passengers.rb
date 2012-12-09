class AddPickupAndDropoffToPassengers < ActiveRecord::Migration
  def self.up
    add_column :passengers, :pickup_at, :datetime
    add_column :passengers, :dropoff_at, :datetime
  end

  def self.down
    remove_column :passengers, :dropoff_at
    remove_column :passengers, :pickup_at
  end
end
