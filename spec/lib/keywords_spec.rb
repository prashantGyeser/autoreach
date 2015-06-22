require 'keywords'
require 'rails_helper'

describe Keywords do

  before :each do
    @article = 'This is a test with somemore keywords to see how things look and then decide of to use the keywords'
  end

  # Todo: This spec needs to be improved so that is not dependent on the text sent in
  it "should return the top keywords given text" do
    keywords = Keywords.new.extract(@article)
    puts keywords.inspect
    expect(keywords.count).to eq 5
  end

end