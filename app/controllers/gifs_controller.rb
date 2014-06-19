class GifsController < ApplicationController
  def index
    matches = Match.today.with_goals.map(&:gifs).flatten

    render json: gifs
  end
end