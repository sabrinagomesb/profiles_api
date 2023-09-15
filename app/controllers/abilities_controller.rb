# frozen_string_literal: true

class AbilitiesController < ApplicationController
  def index
    abilities = if params[:role]
                  Ability.where(role: params[:role])
                else
                  Ability.all
                end

    render json: abilities
  end

  def show
    ability = Ability.find(params[:id])

    render json: ability
  end
end
