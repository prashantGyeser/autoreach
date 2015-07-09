class AddDescriptionToAdminArticles < ActiveRecord::Migration
  def change
    add_column :admin_articles, :description, :text
  end
end
