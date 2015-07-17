# == Schema Information
#
# Table name: user_keywords
#
#  id                        :integer          not null, primary key
#  keyword                   :string
#  weight                    :integer
#  user_id                   :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  keyword_type              :string
#  archived                  :boolean          default(FALSE)
#  last_searched             :datetime
#  total_results_last_search :integer
#  searched                  :boolean          default(FALSE)
#

class UserKeyword < ActiveRecord::Base
  belongs_to :user
  has_many :articles

  after_create :search

  def search
    BingSearchJob.perform_later self
  end

  def self.generate_keywords(token_id)
    tweets_text = combine_tweets(user_tweets(token_id))
    extracted_keywords = extract_keywords(tweets_text)
    store_keywords(extracted_keywords, token_id)
  end

  def self.archive_all(user)
    UserKeyword.where(user_id: user.id).each do |keyword|
      archive_single(keyword)
    end
  end

  def self.archive_single(user_keyword)
    user_keyword.archived = true
    user_keyword.save
  end

  def set_last_searched
    self.last_searched = DateTime.now.utc
    self.save
  end

  def set_search_result_count(result_count)
    self.total_results_last_search = result_count
    self.save
  end

  def set_search_status
    self.searched = true
    self.save
  end

  private
  def self.combine_tweets(tweets)
    tweets.pluck(:tweet).flatten.to_s
  end

  def self.user_tweets(token_id)
    UserTweet.user_tweets(token_id)
  end

  def self.extract_keywords(text)
    Keywords.new.extract(text)
  end

  def self.store_keywords(keywords, token_id)
    keywords.each do |keyword|
      save_keyword(keyword, token_id)
    end
  end

  # Todo: Fix this so that it no matter the extraction method this works
  def self.save_keyword(keyword, token_id)
    UserKeyword.create(keyword: keyword.text, weight: keyword.weight.to_i, token_id: token_id)
  end


end
