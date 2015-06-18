class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :username
      t.string :profile_picture
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
