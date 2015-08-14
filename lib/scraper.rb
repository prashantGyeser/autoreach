class Scraper

  def scrape_page(url)
    # content = get_page_content(url)
    #
    # if content.nil?
    #   embedly_extractor(url)
    # else
    #   return content
    # end

    embedly_extractor(url)

  end

  def embedly_scrapper(url)
    embedly_extractor(url)
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

  def embedly_extractor(url)
    embedly_api = Embedly::API.new :key => ENV['EMBEDLY_KEY'],
                                   :user_agent => 'Mozilla/5.0 (compatible; mytestapp/1.0; prashant@urbanzeak.com)'
    begin
      obj = embedly_api.extract :url => url
      results = obj[0].marshal_dump
      return results[:content]
    rescue => e
      Rollbar.error(e, :url => url, :description => "Error in scrapping a site")
    end


    #json_obj = JSON.pretty_generate(obj[0].marshal_dump)

  end


end
