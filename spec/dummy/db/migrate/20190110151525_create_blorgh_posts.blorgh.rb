# This migration comes from blorgh (originally 20190110150659)
class CreateBlorghPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :blorgh_posts do |t|
      t.string :title
      t.text :body
      t.timestamp :published_at

      t.timestamps
    end
  end
end
