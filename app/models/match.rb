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

  scope :today,    -> { where(played_at: DateTime.now .. DateTime.now.end_of_day) }
  scope :tomorrow, -> { where(played_at: DateTime.tomorrow .. DateTime.tomorrow.end_of_day) }

  def short_description
    "#{home_team.acronym} vs #{away_team.acronym} - #{played_at}"
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
end
