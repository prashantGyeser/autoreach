class Webpage
  attr_accessor :url, :content

  def initialize(args)
    @url = args[:url]
    @content = Scraper.new.scrape_page(@url) || ''
  end

  def contains_article?
    if term_in_url?
      return true
    elsif !@content.nil? #term_in_content?
      return true
    end
    return false
  end

  private
  def term_in_url?
    ["blog","articles"].any? { |w| url[w] }
  end

  def term_in_content?
    begin
      if content.include? "Comments"
        return true
      elsif content.include? "Comment"
        return true
      end
    rescue => e
      Rails.logger.error { "Encountered an error when trying to extract the content from a website: #{url}, #{e.message} #{e.backtrace.join("\n")}" }
    end
    return false
  end


end