class BookingsController < ApplicationController
  def index
    @user = current_user.id
    @bookings = Booking.where(user_id: @user)
  end
  
  def show
    @booking = Booking.find(params[:id])
  end
end
