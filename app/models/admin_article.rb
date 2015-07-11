# == Schema Information
#
# Table name: admin_articles
#
#  id                :integer          not null, primary key
#  url               :string
#  content           :text
#  crawled_on        :datetime
#  admin_search_id   :integer
#  site              :string
#  performance_score :float
#  spam_score        :float
#  title             :text
#  main_image        :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  description       :text
#  facebook_shares   :integer
#

class AdminArticle < ActiveRecord::Base
  include Elasticsearch::Model
  belongs_to :admin_search

  #validates :url, uniqueness: true

end

AdminArticle.import
