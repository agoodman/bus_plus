class RenamePassengerToVehicleInManifests < ActiveRecord::Migration

  def self.up
    rename_column :manifests, :passenger_id, :vehicle_id
  end

  def self.down
    rename_column :manifests, :vehicle_id, :passenger_id
  end
  
end
