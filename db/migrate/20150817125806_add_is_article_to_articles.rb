class AddIsArticleToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :is_article, :boolean, default: false
  end
end
