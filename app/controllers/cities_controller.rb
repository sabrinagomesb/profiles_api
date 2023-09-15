class CitiesController < ApplicationController
  def index
    @cities = City.where(state_id: params[:state_id])
    render json: @cities
  end

  def show
    @city = City.find(params[:id])
    render json: @city
  end
end
