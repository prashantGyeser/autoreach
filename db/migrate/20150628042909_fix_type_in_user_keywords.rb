class FixTypeInUserKeywords < ActiveRecord::Migration
  def change
    rename_column :user_keywords, :type, :keyword_type
  end
end
