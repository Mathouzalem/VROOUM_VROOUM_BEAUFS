class CarsController < ApplicationController
  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    if @car.update(car_params)
      redirect_to car_path(@car)
    else
      render :edit, stauts: :unprocessable_entity
    end
  end

  private

  def car_params
    params.require(:car).permit(:title, :photo, :description, :price, :motor, :fuel, :brand, :year, :modele, :power)
  end
end
