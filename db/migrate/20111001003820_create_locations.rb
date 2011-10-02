class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :newt_id
      t.string :page_title
      t.string :ip
      t.string :url
      t.string :request_count

      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
