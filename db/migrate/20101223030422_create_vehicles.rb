class CreateVehicles < ActiveRecord::Migration
  def self.up
    create_table :vehicles do |t|
      t.float :latitude
      t.float :longitude
      t.integer :seats_available

      t.timestamps
    end
  end

  def self.down
    drop_table :vehicles
  end
end
