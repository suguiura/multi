class ChangeStandardNumberOfPackagesPerSecondInMachines < ActiveRecord::Migration
  def self.up
    change_table :machines do |t|
      t.change :standard_number_of_packages_per_second, :integer
      t.rename :standard_number_of_packages_per_second, :standard_seconds_per_package
    end
  end

  def self.down
    change_table :machines do |t|
      t.change :standard_seconds_per_package, :float
      t.rename :standard_seconds_per_package, :standard_number_of_packages_per_second
    end
  end
end
