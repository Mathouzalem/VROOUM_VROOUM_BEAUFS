class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

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
<<<<<<< HEAD
    
=======
  end

>>>>>>> 3e0c658aab9d94a2aaab9dfd0beb4b8c28464ce1
  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  private

  def car_params
    params.require(:car).permit(:title, :photo, :description, :price, :motor, :fuel, :brand, :year, :modele, :power)
  end
end
