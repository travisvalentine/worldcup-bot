class LinksController < ApplicationController
  def show
    sanitized_acronym = params[:id].strip.upcase

    team = Team.where("acronym = ?", sanitized_acronym).first

    render json: team.fifa_link
  end
end
