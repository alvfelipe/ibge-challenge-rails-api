class StatesController < ApplicationController

  def index
    @states = State.all.order(sort_column + " " + sort_direction)
    render json: @states, except: [:created_at, :updated_at],
           include: { region: { except: [:created_at, :updated_at] } }
  end

  def show
  end

  def create
    @state = State.new(state_params)
  end

  private

  def state_params
    params.require(:state).permit(
      :abbreviation, :name,
      regions_attributes: [:id, :abbreviation, :name]
    )
  end

  def sort_column
    State.name.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
