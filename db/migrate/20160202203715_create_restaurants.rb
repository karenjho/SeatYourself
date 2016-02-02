class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :capacity
      t.string :address
      t.string :phone
      t.string :url
      t.string :photo_url

      t.timestamps null: false
    end
  end
end
