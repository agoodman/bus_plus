class AddEmailToDrivers < ActiveRecord::Migration
  def self.up
    add_column :drivers, :email, :string
  end

  def self.down
    remove_column :drivers, :email
  end
end
