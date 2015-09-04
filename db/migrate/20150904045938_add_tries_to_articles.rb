class AddTriesToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :content_tries, :integer, default: 0
    add_column :articles, :shares_tries, :integer, default: 0
  end
end
