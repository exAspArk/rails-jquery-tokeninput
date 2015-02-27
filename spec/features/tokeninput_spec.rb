require 'spec_helper'
require 'features/pages/world_page'

feature 'Tokeninput' do
  let(:world_page) { WorldPage.new(root_path) }
  let(:country)    { Country.first }

  scenario 'adding a token', js: true do
    world_page.visit_page

    world_page.enter_key_code_to_tokeninput(74) # 'J'

    expect(world_page).to be_with_dropdown
    expect(world_page.dropdown).to have_content(country[:name])

    world_page.select_first_token

    expect(world_page).to be_with_selected_token
    expect(world_page.selected_token).to have_content(country[:name])

    world_page.pass_data

    expect(world_page.response['countries']).to match_array([country[:iso_code]])
  end
end
