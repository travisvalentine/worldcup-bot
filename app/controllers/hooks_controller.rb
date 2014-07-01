class HooksController < ApplicationController
  def last_goal
    campfire = Tinder::Campfire.new(ENV["cf_ssubdomain"], ENV["cf_stoken"])
  end
end