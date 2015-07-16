class AddIrrelevantToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :irrelevant, :boolean, default: false
  end
end
