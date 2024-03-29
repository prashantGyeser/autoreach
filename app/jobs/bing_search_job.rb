class BingSearchJob < ActiveJob::Base
  queue_as :default

  # Deprecated: Eliminate code? This job is no longer in use.
  #   The functionality has been migrated to ArticleSearchJob
  def perform(keyword)
    # search_results = search(keyword)
    # remove_non_articles(search_results[:results])
    # store_articles(parsed_results, keyword)
    # set_keyword_search_details(keyword, search_results[:total_search_results])
    # ArticleQuality.new.eliminate_least_shared(keyword)
    # set_search_status(keyword)
    # #NotificationMailer.search_complete(User.find(keyword[:user_id], keyword))
  end

  private
  # def search(keyword)
  #   SearchBing.new.find_all(keyword[:keyword])
  # end
  #
  # def parse(results)
  #   SearchResults.new.parse_bing(results)
  # end
  #
  # def remove_non_articles(parsed_results)
  #   parsed_results.each_with_index do |result, index|
  #     webpage = webpage(result[:final_url])
  #     if webpage.contains_article?
  #       parsed_results[index][:content] = webpage.content
  #     else
  #       #puts "Deleting url: #{result[:final_url]}"
  #       parsed_results.delete_at(index)
  #     end
  #   end
  #   return parsed_results
  # end
  #
  # def webpage(url)
  #   Webpage.new({url: url})
  # end
  #
  # def store_articles(results, keyword)
  #   results.each do |result|
  #     article = store_article(result, keyword)
  #     if article != false
  #       set_facebook_shares(article)
  #     end
  #   end
  # end
  #
  # def store_article(result, keyword)
  #   article = Article.new(url: result[:final_url], description: result[:description], title: result[:title], user_keyword_id: keyword[:id], user_id: keyword[:user_id])
  #
  #   if result[:content]
  #     article[:content] = result[:content]
  #   end
  #
  #   if article.save
  #     return article
  #   else
  #     Rails.logger.error { "Encountered an error when trying to save the article: #{result[:final_url]}, #{article.errors.full_messages}" }
  #     return false
  #   end
  #
  # end
  #
  # def set_facebook_shares(article)
  #   begin
  #     shares = ArticleQuality.new.facebook_shares({url: article.url})
  #     article.facebook_shares = shares
  #     article.save
  #   rescue => e
  #     Rails.logger.error { "Encountered an error when trying to get the facebook shares: #{article.url}, #{e.message} #{e.backtrace.join("\n")}" }
  #   end
  # end
  #
  # def set_keyword_search_details(keyword, result_count)
  #   keyword.set_last_searched
  #   keyword.set_search_result_count(result_count)
  # end
  #
  # def eliminate_low_share_count_articles(parsed_results)
  #   get_lowest_shares(extract_shares(parsed_results))
  # end
  #
  # def extract_shares(parsed_results)
  #   facebook_shares = []
  #   parsed_results.each do |result|
  #     facebook_shares << result[:facebook_shares]
  #   end
  #   return facebook_shares
  # end
  #
  # def set_search_status(keyword)
  #   keyword.set_search_status
  # end

end
