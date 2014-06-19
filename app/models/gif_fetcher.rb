require 'rubygems'
require 'nokogiri'
require 'open-uri'

class GifFetcher
  def initialize(match)
    @match = match
  end

  def scrape
    big_lead_url = "http://thebiglead.com/tag/2014-world-cup/"

    world_cup_html = Nokogiri::HTML(open(big_lead_url))

    article_summaries = world_cup_html.css(".column.big article")

    links = []

    article_summaries.map do |summary|
      link       = summary.at_css("a.link")
      link_url   = link["href"]
      link_title = link["title"]

      if relevant?(link_title)
        article = Nokogiri::HTML(open(link_url))

        images = article.css(".articleBody img.size-full")

        links << images.map {|i| i["src"] }
      end

    end.compact

    { summary: @match.score_summary, links: links.flatten }
  end

  def relevant?(title)
    title.include?(@match.home_team.name) || title.include?(@match.away_team.name)
  end
end