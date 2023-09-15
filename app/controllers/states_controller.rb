class StatesController < ApplicationController
  def index
    @states = State.all
    render json: @states
  end

  def show
    @state = State.find(params[:id])
    @cities = @state.cities
    render json: @state, include: %i[cities]
  end
end
