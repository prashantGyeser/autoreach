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

  it "should return true when the url contains the required terms" do
    args = {url: 'https://blog.bufferapp.com/social-media-marketing-plan'}
    is_article = Webpage.new(args).contains_article?
    expect(is_article).to be true
  end

  it "should exclude urls that come from unwanted sites" do
    args = {url: 'https://blog.google.com/social-media-marketing-plan'}
    url_excluded = Webpage.new(args).url_excluded?
    expect(url_excluded).to be true
  end

  it "should not exclude urls that contain a brand name" do
    args = {url: 'https://blog.test.com/google'}
    url_excluded = Webpage.new(args).url_excluded?
    expect(url_excluded).to be false
  end

end