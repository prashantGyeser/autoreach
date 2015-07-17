class AddSharesLowToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :shares_low, :boolean, default: false
  end
end
