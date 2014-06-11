class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string   :home_team
      t.string   :away_team
      t.datetime :date
      t.time     :time
      t.string   :stadium
      t.string   :location
      t.string   :group
      t.string   :score

      t.timestamps
    end
  end
end
