class ChangeAdminToString < ActiveRecord::Migration
  def change
    remove_column :users, :admin, :boolean
    add_column :users, :role, :string, default: "user", null: false
  end
end
