class RenameAvailableTimeInMachines < ActiveRecord::Migration
  def self.up
    rename_column :machines, :availableTime, :avaiable_seconds_per_day
  end

  def self.down
    rename_column :machines, :avaiable_seconds_per_day, :availableTime
  end
end
