class ScoresController < ApplicationController
  def index
    matches = Match.today.with_goals.map(&:update)

    render json: matches, each_serializer: ScoreSerializer
  end

  def show
    team = Team.where("acronym = ?", params[:id].upcase).first

    render json: team.past_matches, each_serializer: ScoreSerializer
  end

  def now
    render json: Match.current.map(&:update), each_serializer: ScoreSerializer
  end

  def recap
    matches = Match.today.played.any? ? Match.today.played : Match.yesterday

    render json: matches, each_serializer: ScoreSerializer
  end

  def live
    matches = Match.today.with_goals.map(&:update).select { |m| m.last_scored_at > Time.zone.now - 3.seconds }

    render json: matches, each_serializer: ScoreSerializer
  end
end
