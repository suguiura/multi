class AddProductIdToSessions < ActiveRecord::Migration
  def self.up
    add_column :sessions, :product_id, :integer
  end

  def self.down
    remove_column :sessions, :product_id
  end
end
