class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.integer :role
      t.string :name, limit: 100

      t.timestamps
    end
  end
end
