# == Schema Information
#
# Table name: articles
#
#  id                :integer          not null, primary key
#  url               :string
#  content           :text
#  crawled_on        :datetime
#  keyword_id        :integer
#  site              :string
#  performance_score :integer
#  spam_score        :float
#  title             :text
#  main_image        :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#

class Article < ActiveRecord::Base
  belongs_to :user_keywords
end
