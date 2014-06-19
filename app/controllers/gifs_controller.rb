class GifsController < ApplicationController
  def index
    gifs = Match.today.with_goals.map(&:gifs)

    render json: gifs
  end

  def recap
    gifs = Match.yesterday.with_goals.map(&:gifs)

    render json: gifs
  end
end