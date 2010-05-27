class RenameTotalRejectedToRejections < ActiveRecord::Migration
  def self.up
    rename_column :rejections, :totalRejected, :number_of_rejected_packages
  end

  def self.down
    rename_column :rejections, :number_of_rejected_packages, :totalRejected
  end
end
