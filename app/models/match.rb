class Match < ActiveRecord::Base
  scope :today,    -> { where("date = ?", Time.now.to_date.to_datetime) }
  scope :tomorrow, -> { where("date = ?", Time.now.tomorrow.to_date.to_datetime) }
end
