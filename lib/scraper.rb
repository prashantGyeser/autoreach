class Scraper

  def scrape_page(url)
    get_page_content(url)
  end

  private
  def get_page_content(url)
    begin
      Mechanize.new.get(url).body
    rescue => e
      Rails.logger.error { "Encountered an error when trying scrape a site using mechanize: #{url}, #{e.message} #{e.backtrace.join("\n")}" }
    end
  end


end
