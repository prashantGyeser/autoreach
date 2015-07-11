require 'rails_helper'

describe Scraper do

  before do
    @html = %q{
              <html>
               <head><title>My webpage</title></head>
               <body>
               <h1>Hello Webpage!</h1>
               <div id="references">
                 <p><a href="http://www.google.com">Click here</a> to go to the search engine Google</p>
                 <p>Or you can <a href="http://www.bing.com">click here to go</a> to Microsoft Bing.</p>
                 <p>Don't want to learn Ruby? Then give <a href="http://learnpythonthehardway.org/">Zed Shaw's    Learn Python the Hard Way</a> a try</p>
               </div>

               <div id="funstuff">
                <p>Here are some entertaining links:</p>
                <ul>
                 <li><a href="http://youtube.com">YouTube</a></li>
                 <li><a data-category="news" href="http://reddit.com">Reddit</a></li>
                 <li><a href="http://kathack.com/">Kathack</a></li>
                 <li><a data-category="news" href="http://www.nytimes.com">New York Times</a></li>
                 </ul>
               </div>

               <p>Thank you for reading my webpage!</p>

               </body>
            </html>
            }
  end

  it "should return the content of a page" do
    scraper = Scraper.new
    scraper.send(:get_page_content, 'https://blog.kissmetrics.com/learn-growth-hacking/')
  end

  it "should return only the text content for a html document" do
    scraper = Scraper.new
    text = scraper.send(:extract_text_from_html, @html)
    expect(text).to eq "My webpage Hello Webpage! Click here to go to the search engine Google Or you can click here to go to Microsoft Bing. Don't want to learn Ruby? Then give Zed Shaw's Learn Python the Hard Way a try Here are some entertaining links: YouTube Reddit Kathack New York Times Thank you for reading my webpage!"

  end


end