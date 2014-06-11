class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string  :acronym, limit: 3
      t.string  :name
      t.string  :group
      t.integer :fifa_team_id

      t.timestamps
    end

    add_index :teams, :name, unique: true
    add_index :teams, :acronym, unique: true
  end
end
