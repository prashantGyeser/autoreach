class AddSearchedToUserKeywords < ActiveRecord::Migration
  def change
    add_column :user_keywords, :searched, :boolean, default: false
  end
end
