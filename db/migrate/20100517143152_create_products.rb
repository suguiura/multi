class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.integer :board_type
      t.integer :number_of_holes_per_board
      t.integer :number_of_boards_per_package
      t.integer :number_of_packages

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
