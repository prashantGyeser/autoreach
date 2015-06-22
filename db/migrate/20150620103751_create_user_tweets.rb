class CreateUserTweets < ActiveRecord::Migration
  def change
    create_table :user_tweets do |t|
      t.text :tweet
      t.integer :token_id

      t.timestamps null: false
    end
  end
end
