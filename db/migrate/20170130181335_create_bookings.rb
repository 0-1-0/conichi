class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :User, index: true, foreign_key: true
      t.string :hotel
      t.string :city
      t.date :date_from
      t.date :date_to

      t.timestamps null: false
    end
  end
end
