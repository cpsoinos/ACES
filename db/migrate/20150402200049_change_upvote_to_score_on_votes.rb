class ChangeUpvoteToScoreOnVotes < ActiveRecord::Migration
  def change
    remove_column :votes, :upvote, :boolean
    add_column :votes, :score, :integer, default: 0
  end
end
