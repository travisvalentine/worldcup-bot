class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :short_name
      t.string :proper_name

      t.timestamps
    end
  end
end
