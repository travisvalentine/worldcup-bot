require 'rubygems'
require 'nokogiri'
require 'open-uri'

class Odds
  Breakdown = Struct.new(:home_team, :home_team_wins, :away_team, :away_team_wins, :draw)

  def initialize(match)
    @match = match
  end

  def scrape
    betting_url = "http://sports.bovada.lv/sports-betting/world-cup-matches.jsp"

    matches = Nokogiri::HTML(open(betting_url))

    match_sections = matches.xpath("//div[following-sibling::div[@class='schedule-date']]")

    match_sections.map do |section|
      if section["class"].include?("event left")
        rows = section.css("tr")

        home_row       = rows.first
        home_text      = home_row.css(".competitor-name span").text
        home_team_name = home_text.present? ? home_text : home_row.css(".competitor-name a").text

        home_bet_set   = home_row.css(".moneyline-line-normal span").text
        home_line      = home_bet_set.present? ? home_bet_set : home_row.css(".moneyline-line-sharp a").text

        # why nokogiri finds 4 rows when there are 3 is beyond me but this will likely break
        away_row       = rows[2]
        away_text      = away_row.css(".competitor-name span").text
        away_team_name = away_text.present? ? away_text : away_row.css(".competitor-name a").text

        away_bet_set   = away_row.css(".moneyline-line-normal span").text
        away_line      = away_bet_set.present? ? away_bet_set : away_row.css(".moneyline-line-sharp a").text

        draw_row       = rows.last
        draw_bet_set   = draw_row.css(".moneyline-line-normal span").text
        draw_line      = draw_bet_set.present? ? draw_bet_set : draw_row.css(".moneyline-line-sharp a").text

        next unless [@match.home_team.name, @match.home_team.acronym].include?(home_team_name) &&
                    [@match.away_team.name, @match.away_team.acronym].include?(away_team_name)

        Breakdown.new(home_team_name, home_line, away_team_name, away_line, draw_line)
      end
    end.compact
  end
end