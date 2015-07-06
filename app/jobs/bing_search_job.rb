class BingSearchJob < ActiveJob::Base
  queue_as :default

  def perform(keyword)
    get_articles(keyword)
  end

  private
  def get_articles(keyword)
    search_results = SearchBing.new.find_all(keyword[:keyword])
    parsed_results = SearchResults.new.parse_bing(search_results[:results])
    byebug
    store_articles(parsed_results, keyword)
  end

  def store_articles(parsed_results, keyword)
    parsed_results.each do |result|
      store_article(result, keyword)
    end
  end

  def store_article(result, keyword)
    quality_score = ArticleQuality.new.score({url: result[:final_url]})
    Article.create(url: result[:final_url], description: result[:description], title: result[:title], user_id: keyword.user_id, quality_score: quality_score)
  end

  def test(msg)
    puts msg
  end

end
