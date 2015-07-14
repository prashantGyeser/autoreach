# == Schema Information
#
# Table name: user_keywords
#
#  id           :integer          not null, primary key
#  keyword      :string
#  weight       :integer
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  keyword_type :string
#  archived     :boolean          default(FALSE)
#

FactoryGirl.define do
  factory :user_keyword do
    keyword "MyString"
weight 1
token_id 1
  end

end
