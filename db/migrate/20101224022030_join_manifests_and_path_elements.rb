class JoinManifestsAndPathElements < ActiveRecord::Migration

  def self.up
    create_table :manifests_path_elements, :id => false do |t|
      t.integer :manifest_id
      t.integer :path_element_id
    end
  end

  def self.down
    drop_table :manifests_path_elements
  end
  
end
