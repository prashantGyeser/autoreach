require 'net/http'

# This class currently only searches using the webhose.io api
class Search
  # Deprecated: Eliminate code? Webhose is no longer in use
  #   Bing search code has been migrated to SearchBing
  # attr_accessor :token, :base_url, :search_term
  #
  # def initialize(args)
  #   @token = '49b06853-009e-4737-9bf8-43b2365109d2'
  #   @base_url = 'https://webhose.io/'
  #   @search_term = args[:search_term]
  # end
  #
  # def find
  #   query = perfect_match_query(search_term)
  #   search_results = get_results(generate_perfect_match_url(query))
  #   return SearchResults.new.parse(search_results)
  # end
  #
  # # Summary: The search function takes either a single keyword or an array of keywords
  # def find_all(query)
  #   get_results(generate_url(generate_query(query)))
  #   #bing_search(query)
  # end
  #
  # private
  # def perfect_match_query(term)
  #   '\"' + term + '\"'
  # end
  #
  # def generate_perfect_match_url(query)
  #   # https://webhose.io/search?token=49b06853-009e-4737-9bf8-43b2365109d2&format=json&q=%22GROWTH%20HACKING%22%20performance_score%3A%3E1&language=english&site_type=news&site_type=blogs
  #   url = "#{base_url}search?token=#{token}&format=json&q=#{query} performance_score:>4&language=english&site_type=blogs"
  #   encode_url(url)
  # end
  #
  #
  # def generate_url(query)
  #   # Sample URL: https://webhose.io/search?token=49b06853-009e-4737-9bf8-43b2365109d2&format=json&q=(marketing%20automation%20OR%20mail%20OR%20followers)%20performance_score%3A%3E3&site_type=news&site_type=blogs
  #   # The above sample url gets content from new fees and blogs only.
  #   # The above sample url gets content that has been shared i.e. the performance score
  #   # The url has a multi keyword search
  #   # Sample URL: https://webhose.io/search?token=49b06853-009e-4737-9bf8-43b2365109d2&format=json&q=%22growth%20hacking%22&language=english&site_type=news&site_type=blogs
  #   # The above is for a perfect match of a given keyword
  #   url = "https://webhose.io/search?token=49b06853-009e-4737-9bf8-43b2365109d2&format=json&q=#{query} performance_score:>3&language=english&site_type=blogs"
  #   encode_url(url)
  # end
  #
  # def generate_query(keywords)
  #   if keywords.count > 1
  #     query_keywords = keywords.join(" OR ")
  #     return '(' + query_keywords + ')'
  #   else
  #     return '"' + keywords.first.to_s + '"'
  #   end
  # end
  #
  # def encode_url(url_string)
  #   URI.encode(url_string)
  # end
  #
  # def get_results(encoded_url)
  #   response = HTTParty.get(encoded_url)
  #   return response.body
  # end
  #
  # def bing_search(query)
  #   bing_web = Bing.new('4yJT0kGliAUDUcOJltccNGVIrgvfkB8zrPNBDdKDS+Y', 50, 'Web')
  #   bing_results = bing_web.search(query)
  #
  #   puts bing_results.inspect
  #
  #   return bing_results
  # end


end