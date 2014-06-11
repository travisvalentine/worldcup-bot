class Match < ActiveRecord::Base
  scope :today,    -> { where("date = ?", Time.now.to_date.to_datetime) }
  scope :tomorrow, -> { where("date = ?", Time.now.tomorrow.to_date.to_datetime) }

  def short_description
    "#{home_team} vs #{away_team} - #{time}"
  end

  def long_description
    "#{short_description}\n#{stadium}, #{location}"
  end
end
