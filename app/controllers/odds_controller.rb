class OddsController < ApplicationController
  def index
    odds = Match.today.ongoing.map(&:odds).flatten

    render json: odds
  end
end
