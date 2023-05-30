class BookingsController < ApplicationController
  def index
    @user = current_user.id
    @bookings = Booking.where(user_id: @user)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.status = "En attente"
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def accepted
    @booking.find(params[:id])
    @booking.status = "Accepté"
    @booking.save!
  end

  def declined
    @booking.find(params[:id])
    @booking.status = "Décliné"
    @booking.save!
  end

  def canceled
    @booking = Booking.find(params[:id])
    @booking.status = "Annulé"
    @booking.save!
    redirect_to bookings_path
  end

  def show
    @booking = Booking.find(params[:id])
  end
end
