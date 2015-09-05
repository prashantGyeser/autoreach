# == Schema Information
#
# Table name: articles
#
#  id                 :integer          not null, primary key
#  url                :string
#  content            :text
#  crawled_on         :datetime
#  user_keyword_id    :integer
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
#  irrelevant         :boolean          default(FALSE)
#  shares_low         :boolean          default(FALSE)
#  posted             :boolean          default(FALSE)
#  is_article         :boolean          default(FALSE)
#  content_tries      :integer          default(0)
#  shares_tries       :integer          default(0)
#

class Article < ActiveRecord::Base
  belongs_to :user_keyword

  validates :url, uniqueness: { scope: :user_keyword_id }

  #after_save :get_details

  # def get_details
  #   SetArticleDetailsJob.perform_later self
  # end

  def mark_as_irrelevant
    self.irrelevant = true
    self.save
  end

end

