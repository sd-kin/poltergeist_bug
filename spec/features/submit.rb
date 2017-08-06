require 'rails_helper'

RSpec.feature 'Submit form via AJAX', type: :feature do
  scenario 'submit', js: true do
    visit root_path
    click_button 'Save'

    expect(page).to have_content('form submitted succesfully')
  end
end