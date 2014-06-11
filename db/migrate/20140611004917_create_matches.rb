class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer      :number
      t.string       :round
      t.references   :home_team
      t.references   :away_team
      t.datetime     :played_at
      t.string       :stadium
      t.string       :group, limit: 1
      t.integer      :home_goals
      t.integer      :away_goals
      t.integer      :home_penalty_goals
      t.integer      :away_penalty_goals

      t.timestamps
    end

    add_index :matches, :number, unique: true
    add_index :matches, :round
    add_index :matches, :group
    add_index :matches, :home_team_id
    add_index :matches, :away_team_id
  end
end
