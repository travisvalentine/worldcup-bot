class AddGameTimeToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :game_time, :string
  end
end
