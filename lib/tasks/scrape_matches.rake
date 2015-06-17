desc "Backfill the fifa_team_id for the Teams in the DB from FIFA.com"
task :matches => :environment do

  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'

  match_url = "http://www.fifa.com/womensworldcup/matches/index.html"

  fifa_matches = Nokogiri::HTML(open(match_url))

  fifa_matches.css(".match-list-date").each do |day|
    date = Date.parse(day['id'])

    day.css(".col-xs-12").each do |match|
      home_team = match.at_css(".home")
      away_team = match.at_css(".away")

      home_team_proper_name = home_team.css(".t-nText").text
      away_team_proper_name = away_team.css(".t-nText").text

      # only attempt to add the fifa_team_id if the team exists in the DB
      # and if the Team in the DB's fifa_team_id is nil
      if !home_team_proper_name.scan(/\W/).any?
        home_team_short_name = home_team.css(".t-nTri").text
        away_team_short_name = away_team.css(".t-nTri").text

        home_team_id = home_team["data-team-id"]
        away_team_id = away_team["data-team-id"]

        persisted_home_team = Team.where(acronym: home_team_short_name).first
        persisted_away_team = Team.where(acronym: away_team_short_name).first

        if persisted_home_team.fifa_team_id.nil?
          persisted_home_team.update_attribute(:fifa_team_id, home_team_id)

          p "Updated FIFA ID for #{home_team_short_name}"
        elsif persisted_away_team.fifa_team_id.nil?
          persisted_away_team.update_attribute(:fifa_team_id, away_team_id)

          p "Updated FIFA ID for #{away_team_short_name}"
        end
      end
    end
  end
end