class CreateNewsCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :news_categories do |t|
      t.string :identifier

      t.timestamps
    end
  end
end
