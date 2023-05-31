class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
  end

  def my_car_request # * Méthode concernant le status (accept/rejected)
    @car = Car.find(params[:car_id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to car_mes_demandes_path(@booking.car)
  end

  def accepted # ? a t-on encore besoin de cette méthdoe ?
    @booking.find(params[:id])
    @booking.status = "Accepté"
    @booking.save!
  end

  def declined # ? a t-on encore besoin de cette méthdoe ?
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
    @car = @booking.car
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.status = "En attente"
    @booking.user = current_user
    @booking.car_id = params[:car_id].to_i
    if @booking.save
      redirect_to bookings_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :car_id, :status)
  end
end










 # ! Doublon de la méthode create
 # def create
  #   @booking = Booking.new(booking_params)
  #   @booking.status = "En attente"
  #   if @booking.save
  #     redirect_to booking_path(@booking)
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end
