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
#

class Article < ActiveRecord::Base
  include Elasticsearch::Model
  belongs_to :user_keyword

  validates :url, uniqueness: { scope: :user_keyword_id }

  after_create :set_shares

  def mark_as_irrelevant
    self.irrelevant = true
    self.save
  end

  def set_shares
    GetSharesJob.perform_later self
  end

end

