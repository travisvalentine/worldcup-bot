class Card
  def self.suspensions
    CardScraper.new.suspensions
  end

  def self.for_team(team_acronym)
    CardScraper.new(team_acronym).team_cards
  end
end
