require 'rubygems'
require 'nokogiri'
require 'open-uri'

class ScoreUpdater
  def initialize(match)
    @match = match
  end

  def update
    fifa_prefix = "http://www.fifa.com"
    match_index_url = "/worldcup/matches/index.html"

    formatted_match_date = @match.played_at.to_date.to_s.gsub("-","")

    fifa_matches = Nokogiri::HTML(open(fifa_prefix + match_index_url))

    matches_for_day = fifa_matches.css("##{formatted_match_date}")

    matches_for_day.css(".col-xs-12").each do |match|
      correct_match = match.css(".home .t-nTri").text == @match.home_team.acronym

      ongoing_match = match.css(".s-status-abbr").text.strip != "FT"

      next if !correct_match || @match.game_time == "FINAL"

      match_link = match.at_css("a.mu-m-link")

      match_url = fifa_prefix + match_link["href"]

      match_page = Nokogiri::HTML(open(match_url))

      score_array = match_page.css(".s-scoreText").text.split("-").map(&:to_i)

      home_score = score_array.first
      away_score = score_array.last

      game_time = match_page.at(".lb-post .event-minute").text

      time = ongoing_match ? game_time.strip : "FINAL"

      @match.update_attributes(home_goals: home_score, away_goals: away_score, game_time: time)
    end

    @match
  end
end