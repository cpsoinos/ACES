class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :street_address, null: false
      t.string :city, null: false, default: "Boston"
      t.string :state, null: false, default: "Massachusetts"
      t.string :zip_code, null: false
      t.text :description
      t.string :phone
      t.boolean :reservations, default: false
      t.boolean :delivery, default: false
      t.integer :category_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
