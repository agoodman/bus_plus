class AddTokenToVehicles < ActiveRecord::Migration
  def self.up
    add_column :vehicles, :token, :string
  end

  def self.down
    remove_column :vehicles, :token
  end
end
