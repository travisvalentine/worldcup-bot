require 'rubygems'
require 'nokogiri'
require 'open-uri'

class ScoreUpdater
  def initialize(match)
    @match = match
  end

  def update
    match_url = "http://www.fifa.com/worldcup/matches/index.html"

    formatted_match_date = @match.played_at.to_date.to_s.gsub("-","")

    fifa_matches = Nokogiri::HTML(open(match_url))

    matches_for_day = fifa_matches.css("##{formatted_match_date}")

    matches_for_day.css(".col-xs-12").each do |match|
      correct_match = match.css(".home .t-nTri").text == @match.home_team.acronym

      ongoing_match = match.css(".s-status-abbr").text.strip != "FT"

      return if !correct_match

      score_array = match.css(".s-scoreText").text.split("-").map(&:to_i)

      home_score = score_array.first
      away_score = score_array.last

      time = ongoing_match ? match.css(".s-status").text.strip : "FINAL"

      @match.update_attributes(home_goals: home_score, away_goals: away_score, game_time: time)
    end

    true
  end
end