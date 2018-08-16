class AddStuffToCaves < ActiveRecord::Migration[5.2]
  def change
    add_reference :caves, :cave_type, foreign_key: true
    add_reference :caves, :bed_type, foreign_key: true
    add_column :caves, :accommodates, :integer
    add_column :caves, :number_of_beds, :integer
  end
end
