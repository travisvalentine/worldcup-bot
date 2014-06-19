class GifsController < ApplicationController
  def index
    gifs = Match.yesterday.with_goals.map(&:gifs)

    render json: gifs
  end
end