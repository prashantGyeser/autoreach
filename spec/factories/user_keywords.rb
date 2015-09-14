# == Schema Information
#
# Table name: user_keywords
#
#  id                           :integer          not null, primary key
#  keyword                      :string
#  weight                       :integer
#  user_id                      :integer
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  keyword_type                 :string
#  archived                     :boolean          default(FALSE)
#  last_searched                :datetime
#  total_results_last_search    :integer
#  searched                     :boolean          default(FALSE)
#  total_results_in_last_search :integer
#  processing_complete          :boolean          default(FALSE)
#  offset                       :integer          default(0)
#

FactoryGirl.define do
  factory :user_keyword do
    keyword "MyString"
    user_id 1
  end

end
