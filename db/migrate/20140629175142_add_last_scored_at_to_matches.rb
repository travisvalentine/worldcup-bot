class AddLastScoredAtToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :last_scored_at, :datetime
  end
end
