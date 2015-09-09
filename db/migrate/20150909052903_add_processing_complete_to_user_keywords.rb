class AddProcessingCompleteToUserKeywords < ActiveRecord::Migration
  def change
    add_column :user_keywords, :processing_complete, :boolean, default: false
  end
end
