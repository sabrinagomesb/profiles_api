class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
    render json: @profiles, include: %i[experiences studies]
  end

  def show
    @profile = Profile.find(params[:id])
    render json: @profile, include: %i[experiences studies]
  end

  def create
    @profile = Profile.new(profile_params.except(:studies_attributes))

    if @profile.save
      studies_attributes = profile_params[:studies_attributes]
      studies_attributes.each { |study| study[:profile_id] = @profile.id }

      @profile.studies.create(studies_attributes)
      render json: @profile, status: :created
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:profile).permit(
      :name, :email, :birthdate, :phone, :links, :role, :bio,
      experiences_attributes: %i[title company_name start_date end_date function_performed _destroy],
      studies_attributes: %i[title start_date end_date _destroy]
    )
  end
end
