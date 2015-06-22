class CreateUserKeywords < ActiveRecord::Migration
  def change
    create_table :user_keywords do |t|
      t.string :keyword
      t.integer :weight
      t.integer :token_id

      t.timestamps null: false
    end
  end
end
