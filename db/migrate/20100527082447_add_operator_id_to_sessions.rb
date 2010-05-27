class AddOperatorIdToSessions < ActiveRecord::Migration
  def self.up
    add_column :sessions, :operator_id, :integer
  end

  def self.down
    remove_column :sessions, :operator_id
  end
end
