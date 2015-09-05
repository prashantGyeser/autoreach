class SetAllArticleDetailsJob < ActiveJob::Base
  queue_as :default

  def perform
    articles_without_content = Article.where("content IS NULL AND content_tries < 3")
    articles_without_shares = Article.where("content IS NOT NULL AND facebook_shares IS NULL AND shares_tries < 3")

    get_details(articles_without_content)
    get_details(articles_without_shares)
  end

  private
  def get_details(articles)
    articles.each do |article|
      SetArticleDetailsJob.perform_later article
    end
  end



end
