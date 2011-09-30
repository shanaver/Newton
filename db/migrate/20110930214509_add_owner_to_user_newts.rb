class AddOwnerToUserNewts < ActiveRecord::Migration
  def self.up
    add_column :user_newts, :owner, :boolean, :default => 0
  end

  def self.down
    remove_column :user_newts, :owner
  end
end