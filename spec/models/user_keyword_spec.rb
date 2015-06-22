# == Schema Information
#
# Table name: user_keywords
#
#  id         :integer          not null, primary key
#  keyword    :string
#  weight     :integer
#  token_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe UserKeyword, type: :model do

  before do
    FactoryGirl.create(:user_tweet)
    FactoryGirl.create(:user_tweet)
    FactoryGirl.create(:user_tweet)
  end

  it "stores the keywords for a user" do
    #expect(UserKeyword.generate_keywords(1).count).to be > 0
    #UserKeyword.all.inspect
  end

end
