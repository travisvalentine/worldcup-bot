class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string  :short_name
      t.string  :proper_name
      t.integer :fifa_team_id

      t.timestamps
    end
  end
end
