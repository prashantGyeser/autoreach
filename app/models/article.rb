# == Schema Information
#
# Table name: articles
#
#  id                 :integer          not null, primary key
#  url                :string
#  content            :text
#  crawled_on         :datetime
#  keyword_id         :integer
#  site               :string
#  performance_score  :integer
#  spam_score         :float
#  title              :text
#  main_image         :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#  quality_score      :integer
#  twitter_shares     :integer
#  facebook_shares    :integer
#  google_plus_shares :integer
#  linkedin_shares    :integer
#  description        :text
#

class Article < ActiveRecord::Base
  include Elasticsearch::Model
  belongs_to :user_keywords
end

