class RenameStandardSpeedInMachines < ActiveRecord::Migration
  def self.up
    rename_column :machines, :standard_speed, :standard_number_of_packages_per_second
  end

  def self.down
    rename_column :machines, :standard_number_of_packages_per_second, :standard_speed
  end
end
