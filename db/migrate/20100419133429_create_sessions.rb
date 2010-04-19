class CreateSessions < ActiveRecord::Migration
  def self.up
    create_table :sessions do |t|
      t.datetime :start
      t.datetime :end
      t.references :machine

      t.timestamps
    end
  end

  def self.down
    drop_table :sessions
  end
end
