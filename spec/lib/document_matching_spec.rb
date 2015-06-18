require 'document_matching'
require 'rails_helper'

describe DocumentMatching do
  before(:each) do
    @document_matching = DocumentMatching.new
    @document_1 = 'something'
    @document_2 = 'something else'
  end

  it "should give the similarity between two documents" do
    @document_matching.match(@document_1, @document_2)
  end

end
