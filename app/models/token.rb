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

class Token < ActiveRecord::Base
  belongs_to :user

  def self.from_omniauth(auth)
    # Todo: Add the user_id params to the
    where(provider: auth.provider, uid: auth.uid, user_id: auth.user_id).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |token|
      token.provider = auth['provider']
      token.uid = auth['uid']
      token.oauth_token = auth['credentials']['token']
      token.oauth_secret = auth['credentials']['secret']
      token.name = auth['info']['name']
      token.username = auth['info']['nickname']
      token.profile_picture = auth['info']['image']
      token.user_id = auth['user_id']
    end
  end

end
