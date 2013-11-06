require 'spec_helper'
require 'features/pages/home_page'

feature 'Tokeninput' do
  let(:home_page) { HomePage.new(root_path) }
  let(:country)   { Country.first }

  scenario 'Add tokens', js: true do
    home_page.visit_page.enter_character(74) # 'J'

    expect(page).to have_content(country[:name])
  end
end
