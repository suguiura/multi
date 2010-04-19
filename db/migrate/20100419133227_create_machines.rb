class CreateMachines < ActiveRecord::Migration
  def self.up
    create_table :machines do |t|
      t.string :code
      t.integer :availableTime
      t.integer :totalHeaders

      t.timestamps
    end
  end

  def self.down
    drop_table :machines
  end
end
