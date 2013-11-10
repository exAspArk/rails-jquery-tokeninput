require 'spec_helper'
require 'features/pages/home_page'

feature 'Tokeninput' do
  let(:home_page) { HomePage.new(root_path) }
  let(:country)   { Country.first }

  scenario 'Adding token', js: true do
    home_page.visit_page

    home_page.enter_character(74) # 'J'

    expect(home_page).to be_with_dropdown
    expect(home_page.dropdown).to have_content(country[:name])

    home_page.select_first_token

    expect(home_page).to be_with_selected_token
    expect(home_page.selected_token).to have_content(country[:name])
  end
end
