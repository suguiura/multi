class AddSpeedToMachines < ActiveRecord::Migration
  def self.up
    add_column :machines, :speed, :float
  end

  def self.down
    remove_column :machines, :speed
  end
end
