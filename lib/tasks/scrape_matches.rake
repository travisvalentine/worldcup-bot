desc "Scrape FIFA.com matches and persist them"
task :matches => :environment do

  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'

  match_url = "http://www.fifa.com/worldcup/matches/index.html"

  fifa_matches = Nokogiri::HTML(open(match_url))

  fifa_matches.css(".match-list-date").each do |day|
    date = Date.parse(day['id'])

    day.css(".col-xs-12").each do |match|
      group = match.css(".mu-i-group").text

      stadium = match.css(".mu-i-stadium").text
      location = match.css(".mu-i-venue").text
      time = match.css(".s-scoreText").text

      home_team = match.at_css(".home")
      away_team = match.at_css(".away")

      home_team_proper_name = home_team.css(".t-nText").text
      away_team_proper_name = away_team.css(".t-nText").text

      # For final matches whose teams aren't determined
      # we should create a Match but leave the teams as TBD
      #
      # If we have a team's proper name, we can create
      # the full match and the team
      if home_team_proper_name.scan(/\W/).any?
        persisted_match = Match.create!(
                  home_team: "TBD",
                  away_team: "TBD",
                  date: date,
                  time: time,
                  stadium: stadium.strip,
                  location: location.strip,
                  group: group
                )
      else
        home_team_short_name = home_team.css(".t-nTri").text
        away_team_short_name = away_team.css(".t-nTri").text

        home_team_id = home_team["data-team-id"]
        away_team_id = away_team["data-team-id"]

        persisted_match = Match.create!(
                  home_team: home_team_short_name,
                  away_team: away_team_short_name,
                  date: date,
                  time: time,
                  stadium: stadium.strip,
                  location: location.strip,
                  group: group
                )

        persisted_home_team = Team.find_or_create_by(proper_name: home_team_proper_name, short_name: home_team_short_name, fifa_team_id: home_team_id)
        persisted_away_team = Team.find_or_create_by(proper_name: away_team_proper_name, short_name: away_team_short_name, fifa_team_id: away_team_id)
      end
    end
  end
end