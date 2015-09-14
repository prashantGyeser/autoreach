class AddOffsetToUserKeywords < ActiveRecord::Migration
  def change
    add_column :user_keywords, :offset, :integer, default: 0
  end
end
