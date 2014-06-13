class GroupsController < ApplicationController
  def show
    standings = Group.standings_for(params[:id])

    render json: standings
  end
end
