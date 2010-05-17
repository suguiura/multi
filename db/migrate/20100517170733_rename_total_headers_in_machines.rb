class RenameTotalHeadersInMachines < ActiveRecord::Migration
  def self.up
    rename_column :machines, :totalHeaders, :number_of_heads
  end

  def self.down
    rename_column :machines, :number_of_heads, :totalHeaders
  end
end
