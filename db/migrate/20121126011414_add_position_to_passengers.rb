class AddPositionToPassengers < ActiveRecord::Migration
  def self.up
    add_column :passengers, :position, :integer
  end

  def self.down
    remove_column :passengers, :position
  end
end
