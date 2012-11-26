class AddAssignedAtToCandidates < ActiveRecord::Migration
  def self.up
    add_column :candidates, :assigned_at, :datetime
  end

  def self.down
    remove_column :candidates, :assigned_at
  end
end
