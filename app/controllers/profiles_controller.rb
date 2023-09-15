class ProfilesController < ApplicationController
  before_action :find_profile, only: %i[download show]

  def download
    send_data(@profile.to_pdf, filename: 'profile.pdf', disposition: 'inline')
  end

  def index
    @profiles = Profile.all
    render json: @profiles, include: %i[experiences studies abilities softskills techs]
  end

  def show
    render json: @profile, include: %i[experiences studies abilities softskills techs]
  end

  def create
    @profile = Profile.new(profile_params)

    if valid_softskill_count?(profile_params[:softskill_ids])
      if @profile.save
        render json: @profile, include: %i[experiences studies abilities softskills techs], status: :created
      else
        render json: @profile.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'You must select 3 softskills' }, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:profile).permit(
      :name, :email, :birthdate, :phone, :links, :role, :bio, :city_id,
      experiences_attributes: %i[title company_name start_date end_date function_performed _destroy],
      studies_attributes: %i[title institution link start_date end_date _destroy],
      ability_ids: [],
      softskill_ids: [],
      tech_ids: []
    )
  end

  def valid_softskill_count?(softskill_ids)
    expected_count = 3
    softskill_ids.count == expected_count
  end

  def find_profile
    @profile = Profile.find(params[:id])
  end
end
