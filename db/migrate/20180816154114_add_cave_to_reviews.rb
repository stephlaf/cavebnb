class AddCaveToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :cave, foreign_key: true
  end
end
