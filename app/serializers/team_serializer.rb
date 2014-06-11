class TeamSerializer < ActiveModel::Serializer
  attributes :short_name,
             :proper_name
end
