class GifsController < ApplicationController
  def index
    gifs = Match.today.with_goals.map(&:gifs).flatten

    render json: gifs
  end
end