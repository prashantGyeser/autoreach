# == Schema Information
#
# Table name: admin_searches
#
#  id         :integer          not null, primary key
#  keywords   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AdminSearch < ActiveRecord::Base
  has_many :admin_articles

  after_create :search_for_articles

  def get_articles_count
    article_count = self.admin_articles.count
    if article_count == 0
      return "Processing"
    end
    return article_count
  end

  def search_for_articles
    ArticleSearchJob.perform_later self
  end

end
