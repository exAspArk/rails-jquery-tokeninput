require 'spec_helper'

feature 'Foo' do
  scenario 'Bar', js: true do
    visit root_path
  end
end
