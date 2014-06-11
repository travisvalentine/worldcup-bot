class TeamsController < ApplicationController
  def index
    teams = Team.all

    render json: teams
  end

  def show
    team = Team.where("short_name = ?", params[:id].upcase)

    render json: team
  end

end