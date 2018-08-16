class CreateCaveTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :cave_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
