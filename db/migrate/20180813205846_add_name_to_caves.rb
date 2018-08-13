class AddNameToCaves < ActiveRecord::Migration[5.2]
  def change
    add_column :caves, :name, :string
  end
end
