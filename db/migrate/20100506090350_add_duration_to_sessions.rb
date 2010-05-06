class AddDurationToSessions < ActiveRecord::Migration
  def self.up
    add_column :sessions, :duration, :integer
  end

  def self.down
    remove_column :sessions, :duration
  end
end
