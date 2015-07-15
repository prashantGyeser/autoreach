class AddLastSearchedToUserKeywords < ActiveRecord::Migration
  def change
    add_column :user_keywords, :last_searched, :datetime
    add_column :user_keywords, :total_results_last_search, :integer
  end
end
