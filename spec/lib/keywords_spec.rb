require 'keywords'
require 'rails_helper'

describe Keywords do

  before :each do
    @article = 'This is a test with somemore keywords to see how things look and then decide of to use the keywords'
  end

  it "should return the top keywords given text" do
    keywords = Keywords.new.extract(@article)
    expect(keywords.count).to eq 5
  end

end