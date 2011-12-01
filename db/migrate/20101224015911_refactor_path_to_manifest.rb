class RefactorPathToManifest < ActiveRecord::Migration

  def self.up
    rename_table :paths, :manifests
  end

  def self.down
    rename_table :manifests, :paths
  end
  
end
