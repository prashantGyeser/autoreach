class Scraper

  def scrape_page(url)
    get_page_content(url)
  end

  private
  def get_page_content(url)
    Mechanize.new.get(url).body
  end


end
