require 'rails_helper'
require 'socialmedia/facebook_page'

describe FacebookPage, :vcr do
  before do
    @sample_token = 'CAANMmLhHHKYBAJZCvIYhYh5LpBRGm2XlmhbNLLvmjXAEhT8l0K4HlzZCiFCCymM8qPZA9z5K0kmIz7mnbsp45pxfe79suyWj8jG88B113z1l5HDzaDxd7o1bdHsl3vMCa283D69LFSstcLTiaoIE4AFB1EIu8pALULvwP6H1eUNfOHJP7sd'
  end

  it "should get a list of all the users pages given a valid user token" do
    FacebookPage.new(@sample_token).user_pages
  end

  it "should gracefully exit when an invalid user token is provided"

end