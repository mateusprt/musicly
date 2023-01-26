class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name, limit:100
      t.date :birth_date
      t.text :biography

      t.timestamps
    end
  end
end
