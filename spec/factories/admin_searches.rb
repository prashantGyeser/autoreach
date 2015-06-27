# == Schema Information
#
# Table name: admin_searches
#
#  id         :integer          not null, primary key
#  keywords   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :admin_search do
    keywords "MyString"
  end

end
