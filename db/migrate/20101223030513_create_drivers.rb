class CreateDrivers < ActiveRecord::Migration
  def self.up
    create_table :drivers do |t|
      t.string :first_name
      t.string :last_name
      t.string :license_number

      t.timestamps
    end
  end

  def self.down
    drop_table :drivers
  end
end
