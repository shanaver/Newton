class CreateNewts < ActiveRecord::Migration
  def self.up
    create_table :newts do |t|
      t.string :uniq_id
      t.string :uniq_secret
      t.string :title
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :newts
  end
end
