class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tagname
      t.belongs_to :restaurant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
