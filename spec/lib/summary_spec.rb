require 'summary'
require 'rails_helper'

describe Summary, :vcr do
  before(:each) do

  end

  it "should return a summarized version of a given url" do
    expect(Summary.new.url('https://en.wikipedia.org/wiki/Automatic_summarization')).to eq "Document summarization is another. Generally, there are two approaches to automatic summarization: extraction and abstraction. Furthermore, evaluation of extracted summaries can be automated, since it is essentially a classification task. Even though automating abstractive summarization is the goal of summarization research, most practical systems are based on some form of extractive summarization. Extractive methods work by selecting a subset of existing words, phrases, or sentences in the original text to form the summary. Research into abstractive methods is an increasingly important and active research area, however due to complexity constraints, research to date has focused primarily on extractive methods. These systems are known as multi-document summarization systems. People are subjective, and different authors would choose different sentences."

  end

end
