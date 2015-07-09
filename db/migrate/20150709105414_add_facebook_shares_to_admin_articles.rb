class AddFacebookSharesToAdminArticles < ActiveRecord::Migration
  def change
    add_column :admin_articles, :facebook_shares, :integer
  end
end
