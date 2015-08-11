require 'rails_helper'
require 'socialmedia/post'

describe Post, :vcr do
  before do
    @twitter_credentials = {oauth_token: "2431831016-ksK2t1ztrxvN9nR3gzfQfqLzFeU9oX1BKripKBL", oauth_secret: "YuOSZ6qQCJUiGB6qOAazvRRGmpslZfylvOWdS17qsMgYA"}
  end

  it "should post a message to Twitter" do
    Post.new.twitter(@twitter_credentials, "https://blog.kissmetrics.com/use-kissmetrics-discover-freemium-value/")
  end


end