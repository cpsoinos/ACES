class ChangeRequirementsForReviewsTable < ActiveRecord::Migration
  def up
    change_table :reviews do |t|
      t.change :body, :string, {:null => false}
      t.change :rating, :integer, {:null => false}
      t.change :restaurant_id, :integer, {:null => false}
      t.change :user_id, :integer, {:null => false}
    end
  end

  def down
    change_table :reviews do |t|
      t.change :body, :string, {:null => true}
      t.change :rating, :integer, {:null => true}
      t.change :restaurant_id, :integer, {:null => true}
      t.change :user_id, :integer, {:null => true}
    end
  end
end
