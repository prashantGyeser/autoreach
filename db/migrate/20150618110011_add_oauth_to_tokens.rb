class AddOauthToTokens < ActiveRecord::Migration
  def change
    add_column :tokens, :oauth_token, :string
    add_column :tokens, :oauth_secret, :string
  end
end
