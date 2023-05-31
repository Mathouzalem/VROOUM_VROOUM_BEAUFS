class AddReviewToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :review
  end
end
