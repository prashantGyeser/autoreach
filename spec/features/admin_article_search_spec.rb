require 'rails_helper'

RSpec.feature "Article Search", type: :feature do
  scenario "user searchs for articles" do
    visit "/admin/article_search/index"
  end
end

