class Team < ActiveRecord::Base
  has_many :home_games, class_name: "Match", foreign_key: "home_team_id"
  has_many :away_games, class_name: "Match", foreign_key: "away_team_id"

  def matches
    Match.where("home_team_id = ? OR away_team_id = ?", id, id)
  end

  def future_matches
    matches.where("played_at > ?", DateTime.now)
  end

  def past_matches
    matches.where("played_at <= ?", DateTime.now)
  end

  def combined_name
    "#{acronym} - #{name}"
  end

  def fifa_link
    "<a href='http://www.fifa.com/worldcup/teams/team=#{fifa_team_id}/index.html'>Go to FIFA.com for more on #{name}</a>"
  end
end
