class CreateNewsItems < ActiveRecord::Migration[5.2]
  def change
    create_table :news_items do |t|
      t.references :category, index: true
      t.string :title
      t.text :body
      t.integer :position

      t.timestamps
    end
  end
end
