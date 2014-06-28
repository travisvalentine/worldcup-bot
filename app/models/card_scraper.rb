require 'rubygems'
require 'nokogiri'
require 'open-uri'

class CardScraper
  def initialize(team=nil)
    @team = team
  end

  def suspensions
    suspensions_url = "http://en.wikipedia.org/wiki/2014_FIFA_World_Cup#Discipline"

    wiki_html = Nokogiri::HTML(open(suspensions_url))

    discipline_h3 = wiki_html.css("span#Discipline").first.parent

    discipline_table = discipline_h3.next_element.next_element.next_element

    discipline_table.css("tr").each_with_index.map do |row, index|
      next if index.zero?

      cells = row.css("td")

      player     = cells[0]
      team       = cells[1]
      offense    = cells[2]
      suspension = cells[3]

      player_name = player.at_css(".fn a").text
      team_name   = team.at_css("a").text
      offense     = sanitize(offense.text)
      suspension  = sanitize(suspension.text)

      { player: player_name, team: team_name, offense: offense, suspension: suspension }
    end.compact
  end

  def team_cards
    return [] if @team.nil?

    disciplinary_url = "http://en.wikipedia.org/wiki/2014_FIFA_World_Cup_disciplinary_record#By_team"

    wiki_html = Nokogiri::HTML(open(disciplinary_url))

    by_team_h3 = wiki_html.css("span#By_team").first.parent

    discipline_table = by_team_h3.next_element

    discipline_table.css("tr").each_with_index.map do |row, index|
      next if index.zero?

      cells = row.css("td")

      team        = cells[0]
      yellow_num  = cells[1]
      red_num     = cells[2]
      red_desc    = cells[3]
      reason      = cells[4]
      suspension  = cells[5]

      team_name    = team.at_css("a").text

      next if team_name != @team

      yellow_cards = yellow_num.text
      red_cards    = red_num.text
      offense      = sanitize(reason.text)
      suspension   = sanitize(suspension.text)

      { team: team_name, yellows: yellow_cards, reds: red_cards,
        offense: offense, suspension: suspension }
    end.compact
  end

  def sanitize(text)
    if text == "N/A"
      "N/A"
    else
      text[2..-1].strip.gsub(";","").gsub(/\[(.*?)\]/,"")
    end
  end
end