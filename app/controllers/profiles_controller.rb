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

    #TODO: Refactor
    links = params[:profile][:links]
    @profile.links = links

    if @profile.save
      render json: @profile, include: %i[experiences studies abilities softskills techs], status: :created
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:profile).permit(
      :links, :name, :email, :birthdate, :phone, :role, :bio, :city_id,
      experiences_attributes: %i[title company_name start_date end_date function_performed _destroy],
      studies_attributes: %i[title institution link start_date end_date _destroy],
      ability_ids: [],
      softskill_ids: [],
      tech_ids: []
    )
  end

  def find_profile
    @profile = Profile.find(params[:id])
  end
end
