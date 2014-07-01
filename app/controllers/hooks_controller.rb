class HooksController < ApplicationController
  def last_goal
    render json: params
  end
end