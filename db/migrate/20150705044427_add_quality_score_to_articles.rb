class AddQualityScoreToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :quality_score, :integer
    add_column :articles, :twitter_shares, :integer
    add_column :articles, :facebook_shares, :integer
    add_column :articles, :google_plus_shares, :integer
    add_column :articles, :linkedin_shares, :integer
    add_column :articles, :description, :text
  end
end
