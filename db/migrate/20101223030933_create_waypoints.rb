class CreateWaypoints < ActiveRecord::Migration
  def self.up
    create_table :waypoints do |t|
      t.float :latitude
      t.float :longitude
      t.timestamp :arrival_time

      t.timestamps
    end
  end

  def self.down
    drop_table :waypoints
  end
end
