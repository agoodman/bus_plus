class AddTokenToPassengers < ActiveRecord::Migration
  def self.up
    add_column :passengers, :token, :string
  end

  def self.down
    remove_column :passengers, :token
  end
end
