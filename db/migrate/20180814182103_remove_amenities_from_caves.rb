class RemoveAmenitiesFromCaves < ActiveRecord::Migration[5.2]
  def change
    remove_column :caves, :amenities, :string
  end
end
