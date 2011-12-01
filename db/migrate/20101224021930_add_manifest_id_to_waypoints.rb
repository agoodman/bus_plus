class AddManifestIdToWaypoints < ActiveRecord::Migration

  def self.up
    add_column :waypoints, :manifest_id, :integer
  end

  def self.down
    remove_column :waypoints, :manifest_id
  end
  
end
