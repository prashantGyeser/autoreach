class ContentBackfillJob < ActiveJob::Base
  queue_as :default

  def perform(article)
    content = get_content(url)

    if content
      store_content(article, content)
    end
  end

  private
  def get_content(url)
    Scraper.new.embedly_scrapper(url)
  end

  def store_content(article, content)
    article.content = content
    article.save
  end

end
