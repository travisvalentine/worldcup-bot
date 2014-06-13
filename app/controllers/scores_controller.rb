class ScoresController < ApplicationController
  def index
    matches = Match.today.with_goals

    render json: matches, each_serializer: ScoreSerializer
  end

  def show
    team = Team.where("acronym = ?", params[:id].upcase).first

    render json: team.past_matches, each_serializer: ScoreSerializer
  end

  def now
    render json: Match.current.try(:update), serializer: ScoreSerializer
  end

  def recap
    matches = Match.yesterday

    render json: matches, each_serializer: ScoreSerializer
  end
end
