class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
    render json: @profiles
  end

  def show
    @profile = Profile.find(params[:id])
    render json: @profile
  end

  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      render json: @profile, status: :created
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :email, :birthdate, :phone, :links, :role, :bio)
  end
end
