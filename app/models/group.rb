class Group
  GROUPS = ('A'..'H')

  Standing = Struct.new :team, :games_played, :wins, :draws, :losses, :points, :goals_for, :goals_against do
    def add_win(goals_for, goals_against)
      self.games_played += 1
      self.wins += 1
      self.points += 3
      self.goals_for += goals_for
      self.goals_against += goals_against
    end

    def add_loss(goals_for, goals_against)
      self.games_played += 1
      self.losses += 1
      self.goals_for += goals_for
      self.goals_against += goals_against
    end

    def add_tie(goals)
      self.games_played += 1
      self.draws += 1
      self.points += 1
      self.goals_for += goals
      self.goals_against += goals
    end

    def goal_differential
      goals_for - goals_against
    end
  end

  def self.standings_for(group)
    return [] unless GROUPS.include?(group)

    standings = Team.where(group: group).map{|team| Standing.new(team, 0, 0, 0, 0, 0, 0, 0)}
    matches = Match.played.where(group: group)
    matches.each do |match|
      if match.home_goals == match.away_goals
        standings.detect {|st| st.team == match.home_team}.add_tie(match.home_goals)
        standings.detect {|st| st.team == match.away_team}.add_tie(match.home_goals)
      elsif match.home_goals > match.away_goals
        standings.detect {|st| st.team == match.home_team}.add_win(match.home_goals, match.away_goals)
        standings.detect {|st| st.team == match.away_team}.add_loss(match.away_goals, match.home_goals)
      else
        standings.detect {|st| st.team == match.away_team}.add_win(match.away_goals, match.home_goals)
        standings.detect {|st| st.team == match.home_team}.add_loss(match.home_goals, match.away_goals)
      end
    end
    standings.sort_by { |s| [ -s.points, -s.wins, -s.goal_differential ] }
  end
end