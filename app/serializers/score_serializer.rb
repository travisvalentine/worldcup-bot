class ScoreSerializer < ActiveModel::Serializer
  attributes :home_goals,
             :away_goals,
             :score_summary
end
