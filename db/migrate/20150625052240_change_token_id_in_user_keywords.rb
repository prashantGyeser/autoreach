class ChangeTokenIdInUserKeywords < ActiveRecord::Migration
  def change
    rename_column :user_keywords, :token_id, :user_id
  end
end
