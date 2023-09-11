class TechesController < ApplicationController
  def index
    @teches = Tech.all
    render json: @teches
  end

  def show
    @teches = Tech.find(params[:id])
    render json: @teches
  end
end
