class HooksController < ApplicationController
  def last_goal
    data = params
    campfire = Tinder::Campfire.new(ENV["cf_ssubdomain"], token: ENV["cf_stoken"])

    room = campfire.find_room_by_id ENV["cf_sroom"]

    p room
    p room.name
    p params.inspect
  end
end