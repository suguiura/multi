class CreateRejections < ActiveRecord::Migration
  def self.up
    create_table :rejections do |t|
      t.integer :totalRejected
      t.references :session
      t.references :problem

      t.timestamps
    end
  end

  def self.down
    drop_table :rejections
  end
end
