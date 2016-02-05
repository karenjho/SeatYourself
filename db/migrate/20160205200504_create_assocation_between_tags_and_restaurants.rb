class CreateAssocationBetweenTagsAndRestaurants < ActiveRecord::Migration
  def change
    create_table :tags_restaurants, id: false do |t|
      t.belongs_to :tag, index: true
      t.belongs_to :restaurant, index: true
    end
  end
end
