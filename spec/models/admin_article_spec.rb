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

require 'rails_helper'

RSpec.describe AdminArticle, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
