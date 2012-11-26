class AddAssignedAtToPassengers < ActiveRecord::Migration
  def self.up
    add_column :passengers, :assigned_at, :datetime
  end

  def self.down
    remove_column :passengers, :assigned_at
  end
end
