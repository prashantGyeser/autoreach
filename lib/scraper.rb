class Scraper

  def scrape_page(url)
    get_page_content(url)
  end

  private
  def get_page_content(url)
    begin
      extract_text_from_html(Mechanize.new.get(url).body)
    rescue => e
      Rails.logger.error { "Encountered an error when trying scrape a site using mechanize: #{url}, #{e.message} #{e.backtrace.join("\n")}" }
    end
  end

  def extract_text_from_html(document)
    nokogiri_doc = Nokogiri::HTML(document)
    nokogiri_doc.css('style,script').remove
    document_text = nokogiri_doc.xpath("//text()").text
    document_text.squish
  end

end
