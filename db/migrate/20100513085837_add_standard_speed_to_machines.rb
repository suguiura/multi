class AddStandardSpeedToMachines < ActiveRecord::Migration
  def self.up
    add_column :machines, :standard_speed, :float, :default => 0
  end

  def self.down
    remove_column :machines, :standard_speed
  end
end
