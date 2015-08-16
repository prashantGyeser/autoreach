class SearchBing
  attr_accessor :bing_web, :search_results, :query, :total_available_results, :total_results_returned

  def initialize(args)
    number_of_articles_per_search = args[:articles_per_search] || 50
    @bing_web = Bing.new('4yJT0kGliAUDUcOJltccNGVIrgvfkB8zrPNBDdKDS+Y', number_of_articles_per_search, 'Web')
    @search_results = SearchResults.new
    @query = args[:query]
    @total_available_results = 0
    @total_results_returned = 0
  end

  def find_all(query)
    get_results(query)
  end

  def first_50
    search
  end

  private
  def get_results(query)
    search_results = bing_web.search(query)
    set_total_results_returned(search_results[0][:Web].count)
    results_hash(search_results)
  end

  def results_hash(search_results)
    results = {}
    results[:results] = parse_bing(search_results[0][:Web])
    results[:total_search_results] = search_results[0][:WebTotal]
    return results
  end

  def search
    results = bing_web.search(query)
    set_total_results(results[0][:WebTotal])
    return parse_bing(results[0][:Web])
  end

  def parse_bing(bing_results)
    search_results.parse_bing(bing_results)
  end

  def set_total_results(total_results)
    total_available_results = total_results
  end

  def set_total_results_returned(count)
    total_results_returned = count
  end

end