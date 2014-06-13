class GroupsController < ApplicationController
  def show
    standings = Group.standings_for(params[:id].strip.upcase)

    render json: standings
  end
end
