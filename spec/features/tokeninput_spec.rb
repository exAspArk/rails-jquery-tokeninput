require 'spec_helper'

feature 'Tokeninput' do
  scenario 'Add tokens', js: true do
    visit root_path
    page.execute_script("console.log(document.documentElement.innerHTML)")
  end
end
