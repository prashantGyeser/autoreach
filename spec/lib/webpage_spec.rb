require 'rails_helper'

describe Webpage, :vcr do

  it "returns a boolean indicator to show if a given url is an article or not" do
    args = {url: 'http://thenextweb.com/entrepreneur/2015/06/13/43-lessons-growing-from-0-to-1-million-in-revenue-twice/'}
    is_article = Webpage.new(args).contains_article?
    expect(is_article).to be true
  end

  it "returns a false if the url is not an article" do
    args = {url: 'http://www.urbanzeak.com'}
    is_article = Webpage.new(args).contains_article?
    expect(is_article).to be false
  end

end