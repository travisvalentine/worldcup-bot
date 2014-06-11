class Team < ActiveRecord::Base
  def matches
    Match.where("home_team = ? OR away_team = ?", short_name, short_name)
  end

  def future_matches
    matches.where("date > ?", Time.now.to_date.to_datetime)
  end
end
