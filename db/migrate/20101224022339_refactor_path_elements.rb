class RefactorPathElements < ActiveRecord::Migration

  def self.up
    remove_column :path_elements, :path_id
    remove_column :path_elements, :waypoint_id
    remove_column :path_elements, :index
    remove_column :path_elements, :path_size
    add_column :path_elements, :passenger_id, :integer
    add_column :path_elements, :start_latitude, :float
    add_column :path_elements, :start_longitude, :float
    add_column :path_elements, :start_time, :timestamp
    add_column :path_elements, :end_latitude, :float
    add_column :path_elements, :end_longitude, :float
    add_column :path_elements, :end_time, :timestamp
  end

  def self.down
    add_column :path_elements, :path_id, :integer
    add_column :path_elements, :waypoint_id, :integer
    add_column :path_elements, :index, :integer
    add_column :path_elements, :path_size, :integer
    remove_column :path_elements, :passenger_id, :integer
    remove_column :path_elements, :start_latitude, :float
    remove_column :path_elements, :start_longitude, :float
    remove_column :path_elements, :start_time, :timestamp
    remove_column :path_elements, :end_latitude, :float
    remove_column :path_elements, :end_longitude, :float
    remove_column :path_elements, :end_time, :timestamp
  end
  
end
