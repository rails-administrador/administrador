# This migration comes from news (originally 20190111090934)
class CreateNewsCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :news_categories do |t|
      t.string :identifier

      t.timestamps
    end
  end
end
