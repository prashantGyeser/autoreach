class Keywords
  attr_accessor :rake

  def initialize
    @rake = RakeText.new
  end

  def extract(text)
    rake_keyword_extract(text)
  end

  private
  # This is an implementation of Rapid Automatic Keyword Extraction (RAKE)
  # It extracts multiple keywords i.e. n-grams
  # Source: https://github.com/nok/rake-text-ruby
  def rake_keyword_extract(text)
    rake.analyse text, RakeText.FOX
  end
end
