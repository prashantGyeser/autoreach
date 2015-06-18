require 'keywords'

class DocumentMatching
  attr_accessor :keywords


  def initialize
    @keywords = Keywords.new
  end

  def match(document_1, document_2)

  end

  private
  def get_similarity(document_1, document_2)
    document_1_keywords = extract_keywords(document_1)
    document_2_keywords = extract_keywords(document_2)
    common_keywords(document_1_keywords, document_2_keywords)
  end

  def extract_keywords(document)
    keywords.extract(document)
  end

  def common_keywords(first_keywords_list, second_keywords_list)

    keyword_matches = []

    first_keywords_list.each do |first_keyword|
      second_keywords_list.each do |second_keyword|
        if words_match?(first_keyword[0], second_keyword[0])
          keyword_matches << second_keyword[0]
        end
      end
    end
    return keyword_matches
  end

  def words_match?(keyword_1, keyword_2)
    if keyword_1 == keyword_2
      return true
    end
    return false
  end

end