class AddTotalResultsInLastSearchToUserKeywords < ActiveRecord::Migration
  def change
    add_column :user_keywords, :total_results_in_last_search, :integer
  end
end
