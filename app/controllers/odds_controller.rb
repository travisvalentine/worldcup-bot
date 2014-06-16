class OddsController < ApplicationController
  def index
    odds = Match.today.not_played.map(&:odds).flatten

    render json: odds
  end
end
