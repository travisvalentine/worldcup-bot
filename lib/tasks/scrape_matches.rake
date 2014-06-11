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

      home_team_proper_name = match.css(".home .t-nText").text
      away_team_proper_name = match.css(".away .t-nText").text

      # For final matches whose teams aren't determined
      # we should create a Match but leave the teams as TBD
      #
      # If we have a team's proper name, we can create
      # the full match and the team
      if home_team_proper_name.scan(/\W/).any?
        match = Match.create!(
                  home_team: "TBD",
                  away_team: "TBD",
                  date: date,
                  time: time,
                  stadium: stadium.strip,
                  location: location.strip,
                  group: group
                )
      else
        home_team_short_name = match.css(".home .t-nTri").text
        away_team_short_name = match.css(".away .t-nTri").text

        match = Match.create!(
                  home_team: home_team_short_name,
                  away_team: away_team_short_name,
                  date: date,
                  time: time,
                  stadium: stadium.strip,
                  location: location.strip,
                  group: group
                )

        home_team = Team.find_or_create_by(proper_name: home_team_proper_name, short_name: home_team_short_name)
        away_team = Team.find_or_create_by(proper_name: away_team_proper_name, short_name: away_team_short_name)
      end
    end
  end
end