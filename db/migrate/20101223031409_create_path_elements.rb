class CreatePathElements < ActiveRecord::Migration
  def self.up
    create_table :path_elements do |t|
      t.integer :path_id
      t.integer :waypoint_id
      t.integer :index
      t.integer :path_size

      t.timestamps
    end
  end

  def self.down
    drop_table :path_elements
  end
end
