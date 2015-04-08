class AddNullFalseToUsers < ActiveRecord::Migration
  def change
    change_column :users, :name, :string, default: "no name", :null => false
  end
end
