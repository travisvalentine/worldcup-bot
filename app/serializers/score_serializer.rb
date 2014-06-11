class ScoreSerializer < ActiveModel::Serializer
  attributes :home_team,
             :away_team,
             :score
end
