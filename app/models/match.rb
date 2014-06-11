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

  scope :today,    -> { where(played_at: DateTime.now .. DateTime.now.end_of_day) }
  scope :tomorrow, -> { where(played_at: DateTime.tomorrow .. DateTime.tomorrow.end_of_day) }

  def home_team
    Team.where(id: home_team_id).first
  end

  def away_team
    Team.where(id: away_team_id).first
  end

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
