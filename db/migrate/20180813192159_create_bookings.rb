class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :checkin
      t.date :checkout
      t.string :status
      t.references :cave, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
