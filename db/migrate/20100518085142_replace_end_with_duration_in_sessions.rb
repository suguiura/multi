class ReplaceEndWithDurationInSessions < ActiveRecord::Migration
  def self.up
    change_table :sessions do |t|
      t.change :end, :integer
      t.rename :end, :duration
    end
  end

  def self.down
    change_table :sessions do |t|
      t.change :duration, :datetime
      t.rename :duration, :end
    end
  end
end
