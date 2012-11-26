class CreateCandidates < ActiveRecord::Migration
  def self.up
    create_table :candidates do |t|
      t.integer :vehicle_id
      t.integer :passenger_id
      t.float :bid

      t.timestamps
    end
  end

  def self.down
    drop_table :candidates
  end
end
