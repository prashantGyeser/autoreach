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
#

class Article < ActiveRecord::Base
  include Elasticsearch::Model
  belongs_to :user_keyword

  validates :url, uniqueness: { scope: :user_keyword_id }

  after_create :check_if_article
  after_create :set_shares
  after_create :get_content
  #after_save :backfill_shares

  def backfill_shares
    if content_updated?(self)
      check_if_article
      set_shares
    end
  end

  def content_updated?(article)
    article.content_changed?
  end

  def get_content
    if self.content.nil?
      ContentBackfillJob.perform_later self
    end
  end

  def mark_as_irrelevant
    self.irrelevant = true
    self.save
  end

  def check_if_article
    if !self.content.nil?
      if Webpage.new({url: self.url, content: self.content}).contains_article?
        self.is_article = true
        self.save
      end
    end

  end

  def set_shares
    if is_article && self.facebook_shares.nil?
      GetSharesJob.perform_later self
    end
  end

end

