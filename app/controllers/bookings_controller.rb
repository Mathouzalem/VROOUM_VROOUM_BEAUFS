class BookingsController < ApplicationController
  def index
    @user = current_user.id
    @bookings = Booking.where(user_id: @user)
  end
end
