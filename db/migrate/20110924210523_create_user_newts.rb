class CreateUserNewts < ActiveRecord::Migration
  def self.up
    create_table :user_newts do |t|
      t.integer :user_id
      t.integer :newt_id

      t.timestamps
    end
  end

  def self.down
    drop_table :user_newts
  end
end
