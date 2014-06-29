# encoding: UTF-8

class Match < ActiveRecord::Base
  STADIUMS = {
    'am' => 'Arena Amazonia, Manaus',
    'ba' => 'Arena Fonte Nova, Salvador',
    'ce' => 'Estádio Castelao, Fortaleza',
    'df' => 'Estádio Nacional, Brasília',
    'mg' => 'Estádio Mineirao, Belo Horizonte',
    'mt' => 'Arena Pantanal, Cuiaba',
    'pe' => 'Arena Pernambuco, Recife',
    'pr' => 'Arena da Baixada, Curitiba',
    'rj' => 'Maracanã - Estádio Jornalista Mário Filho, Rio de Janeiro',
    'rn' => 'Estadio das Dunas, Natal',
    'rs' => 'Estadio Beira-Rio, Porto Alegre',
    'sp' => 'Arena Corinthians, São Paulo'
  }

  has_one :away_team, primary_key: :away_team_id, class_name: "Team", foreign_key: "id"
  has_one :home_team, primary_key: :home_team_id, class_name: "Team", foreign_key: "id"

  scope :today,      -> { where(played_at: Time.zone.now.beginning_of_day .. Time.zone.now.end_of_day) }
  scope :tomorrow,   -> { where(played_at: (Time.zone.now + 1.days).beginning_of_day .. (Time.zone.now + 1.days).end_of_day) }
  scope :yesterday,  -> { where(played_at: (Time.zone.now - 1.days).beginning_of_day .. (Time.zone.now - 1.days).end_of_day) }
  scope :with_goals, -> { where("home_goals IS NOT NULL AND away_goals IS NOT NULL") }
  scope :played,     -> { where(game_time: "FINAL") }
  scope :not_played, -> { where("game_time IS NULL") }
  scope :ongoing,    -> { where("game_time IS NOT NULL AND game_time != ?", "FINAL")}

  def self.current
    where(["played_at < ? AND game_time IS NULL OR game_time != ?", Time.zone.now, "FINAL"])
  end

  def short_description
    "#{home_team.acronym} vs #{away_team.acronym} - #{formatted_played_at}"
  end

  def long_description
    "#{short_description}\n, #{location}"
  end

  def full_location
    STADIUMS["#{stadium}"]
  end

  def stadium_name
    full_location.split(",").first
  end

  def formatted_played_at
    localized_played_at.strftime("%-m/%-d %I:%M%p %Z")
  end

  def localized_played_at
    Time.zone.at(played_at)
  end

  def score_summary
    if no_penalty_kicks?
      "#{home_team.acronym} (#{home_goals}) vs #{away_team.acronym} (#{away_goals}) - #{game_time}"
    else
      "#{home_team.acronym} (G: #{home_goals}, PK: #{home_penalty_goals}) vs #{away_team.acronym} (G: #{away_goals}, PK: #{away_penalty_goals}) - #{game_time}"
    end
  end

  def update
    ScoreUpdater.new(self).update
  end

  def odds
    return [] if finished?
    Odds.new(self).scrape
  end

  def gifs
    GifFetcher.new(self).scrape
  end

  def started?
    played_at < Time.zone.now
  end

  def finished?
    game_time == "FINAL"
  end

  def winner
    if !started?
      "not started"
    elsif draw? && no_penalty_kicks?
      "draw"
    else
      winning_team
    end
  end

  def loser
    if !started?
      "not started"
    elsif draw? && no_penalty_kicks?
      "draw"
    else
      losing_team
    end
  end

  def no_penalty_kicks?
    home_penalty_goals.nil? && away_penalty_goals.nil?
  end

  def draw?
    home_goals == away_goals
  end

  def winning_team
    if home_team_won?
      home_team.name
    else
      away_team.name
    end
  end

  def losing_team
    if home_team_won?
      away_team.name
    else
      home_team.name
    end
  end

  def home_team_won?
    if no_penalty_kicks?
      home_goals > away_goals
    else
      home_penalty_goals > away_penalty_goals
    end
  end

  def away_team_won?
    if no_penalty_kicks?
      away_goals > home_goals
    else
      away_penalty_goals > home_penalty_goals
    end
  end

end
