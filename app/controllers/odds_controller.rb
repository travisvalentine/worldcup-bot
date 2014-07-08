class OddsController < ApplicationController
  def index
    odds = Match.today.unfinished.map(&:odds).flatten

    render json: odds
  end
end
