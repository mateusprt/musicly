class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.references :album, foreign_key: true
      t.string :title
      t.integer :duration_in_seconds

      t.timestamps
    end
  end
end
