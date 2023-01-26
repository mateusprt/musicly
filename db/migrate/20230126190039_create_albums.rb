class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.references :artist, foreign_key: true
      t.references :genre, foreign_key: true
      t.string :name, limit: 100
      t.date :release_date
      t.text :description

      t.timestamps
    end
  end
end
