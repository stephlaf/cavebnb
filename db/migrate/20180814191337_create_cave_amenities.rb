class CreateCaveAmenities < ActiveRecord::Migration[5.2]
  def change
    create_table :cave_amenities do |t|
      t.references :cave, foreign_key: true
      t.references :amenity, foreign_key: true

      t.timestamps
    end
  end
end
