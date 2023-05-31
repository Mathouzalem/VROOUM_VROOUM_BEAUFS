class ChangeTimeColumnIntoDateOnBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :start_date
    remove_column :bookings, :end_date
    add_column :bookings, :start_date, :date
    add_column :bookings, :end_date, :date
  end
end
