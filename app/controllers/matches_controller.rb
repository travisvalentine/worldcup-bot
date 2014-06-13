class MatchesController < ApplicationController
  def index
    matches = Match.today.not_played

    render json: matches
  end

  def tomorrow
    matches = Match.tomorrow

    render json: matches
  end

end
