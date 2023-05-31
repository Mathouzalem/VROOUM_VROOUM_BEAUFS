class ReviewsController < ApplicationController
  def index
    @reviews = Review.where(booking_id: params[:booking_id])
  end

  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking_id = @booking.id
    @car = @review.booking.car.id
    if @review.save
      redirect_to car_path(@car)
    else
      render :new, :unprocessable_entity
    end
  end



  private

  def review_params
    params.require(:review).permit(:comment, :rate)
  end
end
