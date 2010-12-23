class CreatePassengers < ActiveRecord::Migration
  def self.up
    create_table :passengers do |t|
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end

  def self.down
    drop_table :passengers
  end
end
