class AddOnDutyToVehicles < ActiveRecord::Migration
  def self.up
    add_column :vehicles, :on_duty, :boolean
  end

  def self.down
    remove_column :vehicles, :on_duty
  end
end
