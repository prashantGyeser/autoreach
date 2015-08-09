class AddPostedToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :posted, :boolean, default: false
  end
end
