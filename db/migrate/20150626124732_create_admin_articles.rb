class CreateAdminArticles < ActiveRecord::Migration
  def change
    create_table :admin_articles do |t|
      t.string :url
      t.text :content
      t.datetime :crawled_on
      t.integer :admin_search_id
      t.string :site
      t.float :performance_score
      t.float :spam_score
      t.text :title
      t.string :main_image

      t.timestamps null: false
    end
  end
end
