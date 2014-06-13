require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  test "standings_for should return nil for unknown group" do
    assert_nil Group.standings_for('Z')
  end

  test "standings_for should return 4 teams for group A" do
    assert_equal 4, Group.standings_for('A').size
  end

  test "standings_for properly calculates standings with 1 game played" do
    match = matches(:m01)
    match.home_team_id = teams(:bra).id
    match.home_goals = 3
    match.away_team_id = teams(:cro).id
    match.away_goals = 1
    assert match.save
    
    standings = Group.standings_for('A')
    first_place = standings.first
    last_place = standings.last
    
    assert_equal teams(:bra), first_place.team
    assert_equal 1, first_place.games_played
    assert_equal 1, first_place.wins
    assert_equal 0, first_place.draws
    assert_equal 0, first_place.losses
    assert_equal 3, first_place.points
    assert_equal 3, first_place.goals_for
    assert_equal 1, first_place.goals_against

    assert_equal teams(:cro), last_place.team
    assert_equal 1, last_place.games_played
    assert_equal 0, last_place.wins
    assert_equal 0, last_place.draws
    assert_equal 1, last_place.losses
    assert_equal 0, last_place.points
    assert_equal 1, last_place.goals_for
    assert_equal 3, last_place.goals_against
  end
end
