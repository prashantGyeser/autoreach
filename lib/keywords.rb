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
    rake.analyse clean_text(text), RakeText.FOX
  end

  def clean_text(text)
    stop_words  = ["","a","ago","also","am","an","and","ani","ar","aren't","arent",
                   "as","ask","at","did","didn't","didnt","do","doe","would",
                   "be","been","best","better"]
    special = ["(",")","@","#","^", "[", "]"]
    text.split.delete_if{|x| stop_words.include?(x.downcase) || special.include?(x) }.join(' ')
  end

end
