class CreateCaves < ActiveRecord::Migration[5.2]
  def change
    create_table :caves do |t|
      t.string :address
      t.string :amenities
      t.string :rating
      t.integer :price
      t.string :availability
      t.string :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
