class CardsController < ApplicationController
  def index
    cards = Card.suspensions

    render json: cards
  end

  def team
    team = Team.where("name LIKE ? OR acronym LIKE ?", params[:name].capitalize, params[:name].upcase).first

    cards = team.nil? ? [] : Card.for_team(team.name)

    render json: cards
  end
end
