class LinksController < ApplicationController
  def show
    sanitized_acronym = params[:id].strip.upcase

    team = Team.where("acronym = ?", sanitized_acronym).first

    if team
      render json: team.fifa_link
    else
      render json: "Be sure to use a team's acronym. For a list try `hungrybot wc teams`"
    end
  end
end
