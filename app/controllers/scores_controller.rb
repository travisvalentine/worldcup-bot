class ScoresController < ApplicationController
  def index
    matches = Match.today

    render json: matches, each_serializer: ScoreSerializer
  end

  def show
    team = Team.where("short_name = ?", params[:id].upcase).first

    render json: team.past_matches, each_serializer: ScoreSerializer
  end
end
