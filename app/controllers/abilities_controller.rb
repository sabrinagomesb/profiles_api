class AbilitiesController < ApplicationController
  def index
    role = params[:role] # Obtenha o parâmetro 'role' da solicitação
    abilities = Ability.where(role: role) # Filtrar habilidades com base no parâmetro 'role'
    render json: abilities
  end
end
