class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :url
      t.text :content
      t.datetime :crawled_on
      t.integer :keyword_id
      t.string :site
      t.integer :performance_score
      t.float :spam_score
      t.text :title
      t.string :main_image

      t.timestamps null: false
    end
  end
end
