class CreatePassengers < ActiveRecord::Migration
  def self.up
    create_table :passengers do |t|
      t.float :start_latitude
      t.float :start_longitude
      t.float :end_latitude
      t.float :end_longitude
      t.integer :vehicle_id

      t.timestamps
    end
  end

  def self.down
    drop_table :passengers
  end
end
