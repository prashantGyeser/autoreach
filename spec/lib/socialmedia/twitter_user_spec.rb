require 'rails_helper'

describe TwitterUser, :vcr do
  before(:each) do
    twitter_credentials = {}
    twitter_credentials[:oauth_token] = '2431831016-ksK2t1ztrxvN9nR3gzfQfqLzFeU9oX1BKripKBL'
    twitter_credentials[:oauth_secret] = 'YuOSZ6qQCJUiGB6qOAazvRRGmpslZfylvOWdS17qsMgYA'
    @twitter_user = TwitterUser.new(twitter_credentials)

  end

  it "should the most recent tweets of a user" do
    expect(@twitter_user.recent_tweets('Urbanzeak').count).to eq 20
  end

end