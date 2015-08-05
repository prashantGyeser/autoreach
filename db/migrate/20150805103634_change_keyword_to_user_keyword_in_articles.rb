class ChangeKeywordToUserKeywordInArticles < ActiveRecord::Migration
  def change
    rename_column :articles, :keyword_id, :user_keyword_id
  end
end
