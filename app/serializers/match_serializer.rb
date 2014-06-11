class MatchSerializer < ActiveModel::Serializer
  attributes :date,
             :home_team,
             :away_team,
             :stadium,
             :location,
             :group,
             :score

end