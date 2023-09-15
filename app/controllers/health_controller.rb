class HealthController < ApplicationController
  def health
    render json: { status: 'UP' }
  end
end
