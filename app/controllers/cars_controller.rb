class CarsController < ApplicationController
  def edit
    @car = Car.find(params[:id])
  end


  # Commit test
  def update
    @car = Car.find(params[:id])
    @car.update(car_params)
    redirect_to car_path(@car)
  end

  private

  def car_params
    params.require(:car).permit(:title, :photo, :description, :price, :motor, :fuel, :brand, :year, :modele, :power)
  end
end
