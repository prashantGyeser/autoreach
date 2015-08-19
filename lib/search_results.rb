class SearchResults

  # This returns an array of posts as an array of hashes
  def parse(results)
    iterate_results(convert_to_hash(results))
  end

  def parse_bing(results)
    iterate_bing_results(results)
  end

  private
  def convert_to_hash(search_results)
    JSON.parse(search_results)
  end

  def iterate_results(results_hash)
    post_hashes = []
    results_hash["posts"].each do |post|
      post_hashes << parse_post(post)
    end
    return post_hashes
  end
  
  def parse_post(post)
    post_hash = {}
    post_hash[:url] = post["url"]
    post_hash[:final_url] = get_final_url(post["url"])
    post_hash[:published] = post["published"]
    post_hash[:title] = post["title"]
    post_hash[:text] = post["text"]
    post_hash[:performance_score] = post["thread"]["performance_score"]
    post_hash[:spam_score] = post["thread"]["spam_score"]
    return post_hash
  end

  def get_final_url(url)
    response = HTTParty.get(url)
    extract_url_from_omgili(response.body)
  end

  def extract_url_from_omgili(html)
    page = MetaInspector.new("http://omgili.com",
                             :document => html)
    return page.links.raw.first
  end

  def iterate_bing_results(results)
    links_array = []
    results.each do |result|
      links_array << parse_bing_results(result)
    end
    return links_array
  end

  def parse_bing_results(result)
    results_hash = {}
    results_hash[:final_url] = result[:Url]
    results_hash[:title] = result[:Title]
    results_hash[:description] = result[:Description]
    results_hash[:text] = get_content(result[:Url]) || nil
    results_hash[:performance_score] = nil
    results_hash[:spam_score] = nil
    results_hash[:published] = nil
    return results_hash
  end

  def get_content(url)
    Scraper.new.scrape_page(url)
  end

end