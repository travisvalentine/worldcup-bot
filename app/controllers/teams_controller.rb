class TeamsController < ApplicationController
  def index
    teams = Team.all

    render json: teams
  end

  def show
    team = Team.where("acronym = ?", params[:id].upcase).first

    render json: team
  end

end