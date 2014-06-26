class TeamSerializer < ActiveModel::Serializer
  attributes :name,
             :acronym,
             :group,
             :group_ranking,
             :fifa_link,
             :combined_name
end
