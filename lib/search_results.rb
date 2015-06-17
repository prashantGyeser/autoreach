class SearchResults

  # This returns an array of posts as an array of hashes
  def parse(results)
    iterate_results(convert_to_hash(results))
  end

  private
  def convert_to_hash(search_results)
    JSON.parse(search_results)
  end

  def iterate_results(results_hash)
    post_hashs = []
    results_hash["posts"].each do |post|
      post_hashs << parse_post(post)
    end
    return post_hashs
  end

  # Todo: Ensure that httpparty automatically follows redirects
  def parse_post(post)
    post_hash = {}
    post_hash[:url] = post["url"]
    post_hash[:published] = post["published"]
    post_hash[:title] = post["title"]
    post_hash[:text] = post["text"]
    post_hash[:performance_score] = post["thread"]["performance_score"]
    post_hash[:spam_score] = post["thread"]["spam_score"]
    return post_hash
  end



end