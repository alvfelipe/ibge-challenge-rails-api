class CitiesController < ApplicationController
  def index
    @cities = City.all
    render json: @cities, except: [:created_at, :updated_at],
           include: { state: { except: [:created_at, :updated_at] } }
  end

  def show
  end

  def create
    @city = City.new(city_params)
  end

  private

  def city_params
    params.require(:city).permit(:name)
  end
end
