class AddNumberOfPackagesToSessions < ActiveRecord::Migration
  def self.up
    add_column :sessions, :number_of_packages, :integer
  end

  def self.down
    remove_column :sessions, :number_of_packages
  end
end
