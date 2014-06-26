class MatchSerializer < ActiveModel::Serializer
  attributes :short_description,
             :stadium_name,
             :full_location,
             :odds,
             :formatted_played_at,
             :localized_played_at

  has_one :home_team, serializer: TeamSerializer
  has_one :away_team, serializer: TeamSerializer
end