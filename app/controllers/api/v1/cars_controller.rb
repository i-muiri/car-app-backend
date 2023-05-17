class Api::V1::CarsController < ApplicationController
  def index
    cars = Car.all 
    render json: cars, status: 200
  end

  def show
    car = Car.find_by(id: params[:id])
    if car
      render json: car, status: 200
    else
      render json: {
        error: "Couldn't find"
      }
    end
  end

  def create
    car = Car.new(
      lplate:car_params[:lplate],
      make: car_params[:make],
      model: car_params[:model],
      yom: car_params[:yom],
      bp: car_params[:bp],
      sp: car_params[:sp],
      repcost: car_params[:repcost],
      profit: car_params[:profit],
    )

    if car.save
      render json: car, status: 200
    else
      render json: {error: "Error Creating Car"}
      end
  end

  def update
    car = Car.find_by(id: params[:id])
    if car 
      car.update(lplate: params[:lplate], make: params[:make], model: params[:model], yom: params[:yom], bp: params[:bp], repcost: params[:repcost], profit: params[:profit])
      render json: "Car updated successfully"
    else
      render json: {error: "Error updating Car"}
    end
  end

  def destroy
    car = Car.find_by(id: params[:id])
    if car 
      car.destroy
      render json: "Car deleted successfully"
    end
  end


  private
  def car_params
    params.require(:car).permit([
      :lplate,
      :make,
      :model,
      :yom,
      :bp,
      :sp,
      :repcost,
      :profit

    ])
    end
end
