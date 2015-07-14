class AddArchivedToUserKeywords < ActiveRecord::Migration
  def change
    add_column :user_keywords, :archived, :boolean, default: false
  end
end
