class AddIndexToBookings < ActiveRecord::Migration
  def change
    add_index :bookings, :start_date
    add_index :bookings, :end_date 
    add_index :bookings, [:start_date, :end_date]
  end
end
