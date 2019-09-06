class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.text :title, null: false
      t.integer :yr, null: false
      t.integer :band_id, null: false
      t.timestamp
    end
    add_index :albums, :band_id
  end
end
