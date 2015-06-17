require 'net/http'

# This class currently only searches using the webhose.io api
class Search

  def find_all(query)
    get_results(generate_url(query))
  end

  private
  def generate_url(query)
    # Sample URL: https://webhose.io/search?token=49b06853-009e-4737-9bf8-43b2365109d2&format=json&q=marketing%20automation
    url = "https://webhose.io/search?token=49b06853-009e-4737-9bf8-43b2365109d2&format=json&site_type=blogs&q=" + query
    encode_url(url)
  end

  def encode_url(url_string)
    URI.encode(url_string)
  end

  def get_results(encoded_url)
    response = HTTParty.get(encoded_url)
    return response.body
  end

end