class AddTypeToUserKeywords < ActiveRecord::Migration
  def change
    add_column :user_keywords, :type, :string
  end
end
