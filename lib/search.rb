require 'net/http'

# This class currently only searches using the webhose.io api
class Search

  # Summary: The search function takes either a single keyword or an array of keywords
  def find_all(query)
    get_results(generate_url(generate_query(query)))
  end

  private
  def generate_url(query)
    # Sample URL: https://webhose.io/search?token=49b06853-009e-4737-9bf8-43b2365109d2&format=json&q=(marketing%20automation%20OR%20mail%20OR%20followers)%20performance_score%3A%3E3&site_type=news&site_type=blogs
    # The above sample url gets content from new fees and blogs only.
    # The above sample url gets content that has been shared i.e. the performance score
    # The url has a multi keyword search
    #url = "https://webhose.io/search?token=49b06853-009e-4737-9bf8-43b2365109d2&format=json&site_type=blogs&q=" + query
    url = "https://webhose.io/search?token=49b06853-009e-4737-9bf8-43b2365109d2&format=json&q=#{query} performance_score:>3&language=english&site_type=blogs"
    encode_url(url)
  end

  def generate_query(keywords)
    if keywords.count > 1
      query_keywords = keywords.join(" OR ")
      return '(' + query_keywords + ')'
    else
      return keywords
    end
  end

  def encode_url(url_string)
    URI.encode(url_string)
  end

  def get_results(encoded_url)
    response = HTTParty.get(encoded_url)
    return response.body
  end

end