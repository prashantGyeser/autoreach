class SearchBing
  attr_accessor :bing_web

  def initialize
    @bing_web = Bing.new('4yJT0kGliAUDUcOJltccNGVIrgvfkB8zrPNBDdKDS+Y', 50, 'Web')
  end

  def find_all(query)
    get_results(query)
  end

  private
  def get_results(query)
    results_hash(bing_web.search(query))
  end

  def results_hash(search_results)
    results = {}
    results[:results] = search_results[0][:Web]
    results[:total_search_results] = search_results[0][:WebTotal]
    return results
  end

end