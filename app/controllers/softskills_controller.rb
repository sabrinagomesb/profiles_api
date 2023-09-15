class SoftskillsController < ApplicationController
  def index
    @softskills = Softskill.all
    render json: @softskills
  end

  def show
    @softskill = Softskill.find(params[:id])
    render json: @softskill
  end
end
