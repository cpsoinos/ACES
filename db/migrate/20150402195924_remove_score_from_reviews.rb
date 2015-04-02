class RemoveScoreFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :score, :integer
  end
end
