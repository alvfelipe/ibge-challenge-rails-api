class RegionsController < ApplicationController

  def index
    @regions = Region.all
    render json: @regions, except: [:created_at, :updated_at]
  end

  def create
    @region = Region.new(region_params)
  end

  def show
  end

  private

    def region_params
      params.require(:region).permit(:abbreviation, :name)
    end
end

