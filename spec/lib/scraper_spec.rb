require 'rails_helper'

describe Scraper do

  it "should return the content of a page" do
    scraper = Scraper.new
    scraper.send(:get_page_content, 'https://blog.kissmetrics.com/learn-growth-hacking/')
  end


end