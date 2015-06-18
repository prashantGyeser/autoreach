# == Schema Information
#
# Table name: tokens
#
#  id              :integer          not null, primary key
#  provider        :string
#  uid             :string
#  name            :string
#  username        :string
#  profile_picture :string
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  oauth_token     :string
#  oauth_secret    :string
#

require 'rails_helper'

RSpec.describe Token, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
